// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:jmaker_fablab/Controller/auth_controller.dart';
import 'package:jmaker_fablab/Controller/snackbar_controller.dart';
import 'package:jmaker_fablab/Views/internet_connection_checker.dart';
import 'package:jmaker_fablab/routes/app_router.gr.dart';
import 'package:jmaker_fablab/styles/formStyles.dart';
import 'package:jmaker_fablab/styles/text_style.dart';
import 'package:jmaker_fablab/styles/buttons.dart';
import 'package:jmaker_fablab/styles/color.dart';

@RoutePage()
class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey2 = GlobalKey<FormState>();
  late TextEditingController _emailController;
  late TextEditingController _forgotPasswordController;
  late TextEditingController _passwordController;

  bool isLoading = false;
  bool isLoadingForgotPassword = false;

  @override
  void initState() {
    _emailController = TextEditingController();
    _forgotPasswordController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _forgotPasswordController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InternetConnectionChecker(
      child: (isOfflineMode) {
        print(isOfflineMode);
        return Scaffold(
          appBar: AppBar(
            leading: context.router.canPop()
                ? IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      color: blackGreen,
                    ),
                    onPressed: context.maybePop,
                  )
                : null,
          ),
          backgroundColor: whiteBG,
          body: SafeArea(
            child: Form(
              key: _formKey,
              child: Center(
                child: ListView(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  shrinkWrap: true,
                  children: [
                    Image.asset(
                      'assets/images/jmaker_symbol.png',
                      fit: BoxFit.contain,
                      height: 130,
                      width: 130,
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Log In to JMakers',
                      textAlign: TextAlign.center,
                      style: CustomTextStyle.boldHeader,
                    ),
                    Text(
                      "Let's start making your ideas come to life!",
                      textAlign: TextAlign.center,
                      style: CustomTextStyle.secondaryGrey,
                    ),
                    const SizedBox(height: 32),
                    TextFormField(
                      controller: _emailController,
                      decoration: CustomFormDecoration(
                        borderColor: secondGrey,
                        focusedBorderColor: mainYellow,
                        labelText: 'Email',
                        hintText: 'Enter the email you signed up with.',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email address';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _passwordController,
                      decoration: CustomFormDecoration(
                        borderColor: secondGrey,
                        focusedBorderColor: mainYellow,
                        labelText: 'Password',
                        hintText: 'Enter your password.',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      // Align to the end (right)
                      children: [
                        TextButton(
                          onPressed: () {
                            if (isOfflineMode) {
                              SnackBarController.showSnackBar(context, 'Sorry, forgot password is not available in offline mode.');

                              return;
                            }

                            // Add functionality for handling forgot password (e.g., navigate to password reset screen)
                            showModalBottomSheet(
                              isScrollControlled: true,
                              context: context,
                              builder: (context) {
                                return StatefulBuilder(
                                  builder: (context, setState) => Container(
                                    margin: MediaQuery.of(context).viewInsets,
                                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
                                    child: Form(
                                      key: _formKey2,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            'Forgot Password?',
                                            style: CustomTextStyle.boldHeader,
                                          ),
                                          Text(
                                            "Enter your email address to reset your password.",
                                            style: CustomTextStyle.secondaryGrey,
                                          ),
                                          const SizedBox(height: 24),
                                          TextFormField(
                                            controller: _forgotPasswordController,
                                            decoration: CustomFormDecoration(
                                              borderColor: secondGrey,
                                              focusedBorderColor: mainYellow,
                                              labelText: 'Email',
                                              hintText: 'Enter the email you signed up with.',
                                            ),
                                            validator: (value) {
                                              if (value == null || value.isEmpty) {
                                                return 'Please enter your email address';
                                              }
                                              return null;
                                            },
                                          ),
                                          const SizedBox(height: 16),
                                          ElevatedButton(
                                            style: longYellow,
                                            onPressed: () async {
                                              if (_formKey2.currentState?.validate() ?? false) {
                                                setState(() => isLoadingForgotPassword = true);
                                                await AuthController().sendPasswordResetEmail(
                                                  context,
                                                  _forgotPasswordController.text,
                                                );

                                                context.router.maybePop();

                                                setState(() => isLoadingForgotPassword = false);
                                              }
                                            }, //attach navigation to dashboard
                                            child: isLoadingForgotPassword
                                                ? const Center(
                                                    child: CircularProgressIndicator.adaptive(),
                                                  )
                                                : Text(
                                                    'Submit',
                                                    style: CustomTextStyle.primaryBlack,
                                                  ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ).then((_) => _forgotPasswordController.clear());
                          },
                          child: Text(
                            'Forgot your password?',
                            style: CustomTextStyle.secondaryGrey, // Apply your desired style
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 8, 16),
                      child: ElevatedButton(
                        style: longYellow,
                        onPressed: () async {
                          log(isOfflineMode.toString());
                          if (_formKey.currentState?.validate() ?? false) {
                            setState(() => isLoading = true);
                            await AuthController().signIn(
                              context,
                              email: _emailController.text,
                              password: _passwordController.text,
                              isOfflineMode: isOfflineMode,
                            );
                            setState(() => isLoading = false);
                          }
                        }, //attach navigation to dashboard
                        child: isLoading
                            ? const Center(
                                child: CircularProgressIndicator.adaptive(),
                              )
                            : Text(
                                'Log-In.',
                                style: CustomTextStyle.primaryBlack,
                              ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // Align to the end (right)
                      children: [
                        TextButton(
                          onPressed: () {
                            if (isOfflineMode) {
                              SnackBarController.showSnackBar(context, 'Sorry, account creation is not available in offline mode.');

                              return;
                            }

                            context.router.push(const AccountTypeRoute());
                          },
                          child: Text(
                            "Don't have an account? Sign Up",
                            style: CustomTextStyle.secondaryGrey, // Apply your desired style
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
