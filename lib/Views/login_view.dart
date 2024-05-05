import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:jmaker_fablab/Controller/auth_controller.dart';
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
  late TextEditingController _universityEmailController;
  late TextEditingController _forgotPasswordController;
  late TextEditingController _passwordController;

  bool isLoading = false;

  @override
  void initState() {
    _universityEmailController = TextEditingController();
    _forgotPasswordController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _universityEmailController.dispose();
    _forgotPasswordController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteBG,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              if (context.router.canPop())
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios_new,
                        color: blackGreen,
                      ),
                      onPressed: context.maybePop,
                    ),
                  ],
                ),
              const SizedBox(height: 16),
              Image.asset('assets/images/jmaker_symbol.png', fit: BoxFit.contain, height: 130, width: 130),
              Text(
                'Log In to JMakers',
                style: CustomTextStyle.boldHeader,
              ),
              Text(
                "Let's start making your ideas come to life!",
                style: CustomTextStyle.secondaryGrey,
              ),
              const SizedBox(height: 32),
              TextFormField(
                controller: _universityEmailController,
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
                      // Add functionality for handling forgot password (e.g., navigate to password reset screen)
                      showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (context) {
                          return Container(
                            margin: MediaQuery.of(context).viewInsets,
                            padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
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
                                    if (_formKey.currentState?.validate() ?? false) {
                                      setState(() => isLoading = true);
                                      // await AuthController().signIn(
                                      //   context,
                                      //   email: _universityEmailController.text,
                                      //   password: _passwordController.text,
                                      // );
                                      setState(() => isLoading = false);
                                    }
                                  }, //attach navigation to dashboard
                                  child: isLoading
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
                          );
                        },
                      );
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
                    if (_formKey.currentState?.validate() ?? false) {
                      setState(() => isLoading = true);
                      await AuthController().signIn(
                        context,
                        email: _universityEmailController.text,
                        password: _passwordController.text,
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
              const Expanded(
                  child: SizedBox(
                height: double.infinity,
              )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // Align to the end (right)
                children: [
                  TextButton(
                    onPressed: () => context.router.push(const AccountTypeRoute()),
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
      )),
    );
  }
}
