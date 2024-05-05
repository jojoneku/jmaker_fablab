// ignore_for_file: use_build_context_synchronously

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:jmaker_fablab/Controller/auth_controller.dart';
import 'package:jmaker_fablab/Controller/firestore_controller.dart';
import 'package:jmaker_fablab/Controller/snackbar_controller.dart';
import 'package:jmaker_fablab/Model/student_model.dart';
import 'package:jmaker_fablab/styles/text_style.dart';
import 'package:jmaker_fablab/styles/buttons.dart';
import 'package:jmaker_fablab/styles/color.dart';
import 'package:jmaker_fablab/styles/formStyles.dart';

@RoutePage()
class StudentAccountView extends StatefulWidget {
  const StudentAccountView({super.key, this.userData});

  final StudentModel? userData;

  @override
  State<StudentAccountView> createState() => _StudentAccountViewState();
}

class _StudentAccountViewState extends State<StudentAccountView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _firstNameController;
  late TextEditingController _middeInitialController;
  late TextEditingController _lastNameController;
  late TextEditingController _studentIdController;
  late TextEditingController _contactNumberController;
  late TextEditingController _academeController;
  late TextEditingController _academicProgramController;
  late TextEditingController _universityEmailController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;

  late String selectedGender;
  late String selectedMinority;

  final List<String> gender = ['Male', 'Female', 'LGBTQ+', 'Prefer not to Say'];
  final List<String> minority = ['Youth', 'PWD', 'Senior Citizen+'];
  bool isChecked = false;
  bool isLoading = false;

  @override
  void initState() {
    selectedGender = widget.userData?.gender ?? 'Male';
    selectedMinority = widget.userData?.minority ?? 'Youth';
    _firstNameController = TextEditingController(text: widget.userData?.firstName);
    _middeInitialController = TextEditingController(text: widget.userData?.middleInitial);
    _lastNameController = TextEditingController(text: widget.userData?.lastName);
    _studentIdController = TextEditingController(text: widget.userData?.studentId);
    _contactNumberController = TextEditingController(text: widget.userData?.contactNumber);
    _academeController = TextEditingController(text: widget.userData?.academe);
    _academicProgramController = TextEditingController(text: widget.userData?.academicProgram);
    _universityEmailController = TextEditingController(text: widget.userData?.universityEmail);
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _middeInitialController.dispose();
    _lastNameController.dispose();
    _studentIdController.dispose();
    _contactNumberController.dispose();
    _academeController.dispose();
    _academicProgramController.dispose();
    _universityEmailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteBG,
      appBar: AppBar(
        backgroundColor: whiteBG,
        leading: IconButton(
          onPressed: context.maybePop,
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: blackGreen, // Used color property for icon color
          ),
        ),
        centerTitle: true,
        title: Column(
          children: [
            Text(
              widget.userData != null ? 'My Profile' : 'Signing Up as a Student',
              style: CustomTextStyle.boldHeader,
            ),
            Text(
              "Let's ${widget.userData != null ? 'edit' : 'build'} your profile now!",
              style: CustomTextStyle.secondaryGrey,
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Image.asset(
              'assets/images/student_icon.png',
              fit: BoxFit.contain,
              height: 50,
              width: 40,
            ),
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Student Information'),
                const Divider(),
                const SizedBox(height: 16),
                //FirstNameMI
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: TextFormField(
                        controller: _firstNameController,
                        decoration: CustomFormDecoration(
                          borderColor: secondGrey,
                          focusedBorderColor: mainYellow,
                          labelText: 'First Name',
                          hintText: 'Enter your first name.',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Required';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: TextFormField(
                        controller: _middeInitialController,
                        decoration: CustomFormDecoration(
                          borderColor: secondGrey,
                          focusedBorderColor: mainYellow,
                          labelText: 'M.I.',
                          hintText: 'Initial',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Required';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                //Lastname
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
                  child: TextFormField(
                    controller: _lastNameController,
                    decoration: CustomFormDecoration(
                      borderColor: secondGrey,
                      focusedBorderColor: mainYellow,
                      labelText: 'Last Name',
                      hintText: 'Enter your last name.',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Required';
                      }
                      return null;
                    },
                  ),
                ),
                //studentID
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: TextFormField(
                        controller: _studentIdController,
                        keyboardType: TextInputType.number,
                        decoration: CustomFormDecoration(
                          borderColor: secondGrey,
                          focusedBorderColor: mainYellow,
                          labelText: 'Student ID',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Required';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      flex: 3,
                      child: TextFormField(
                        controller: _contactNumberController,
                        keyboardType: TextInputType.phone,
                        decoration: CustomFormDecoration(
                          borderColor: secondGrey,
                          focusedBorderColor: mainYellow,
                          labelText: 'Contact Number',
                          hintText: 'Enter contact number.',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Required';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                //Academe
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
                  child: TextFormField(
                    controller: _academeController,
                    decoration: CustomFormDecoration(
                      borderColor: secondGrey,
                      focusedBorderColor: mainYellow,
                      labelText: 'Academe',
                      hintText: 'Name of affiliated university.',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Required';
                      }
                      return null;
                    },
                  ),
                ),
                //Program
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
                  child: TextFormField(
                    controller: _academicProgramController,
                    decoration: CustomFormDecoration(
                      borderColor: secondGrey,
                      focusedBorderColor: mainYellow,
                      labelText: 'Academic Program',
                      hintText: 'Enter your program.',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Required';
                      }
                      return null;
                    },
                  ),
                ),
                //University Email
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: TextFormField(
                    enabled: widget.userData == null,
                    controller: _universityEmailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: CustomFormDecoration(
                      borderColor: secondGrey,
                      focusedBorderColor: mainYellow,
                      labelText: 'University Email',
                      hintText: 'Enter your email.',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Required';
                      }
                      return null;
                    },
                  ),
                ),
                const Text('Disaggregiation'),
                const Divider(),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        // Use genders list
                        decoration: CustomFormDecoration(
                          labelText: 'Gender',
                          borderColor: secondGrey,
                          focusedBorderColor: mainYellow,
                        ),
                        value: selectedGender,
                        items: gender
                            .map((gender) => DropdownMenuItem(
                                  value: gender,
                                  child: Text(gender),
                                ))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedGender = value!;
                          });
                        },
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        // Use minority list
                        decoration: CustomFormDecoration(
                          labelText: 'Minority',
                          borderColor: secondGrey,
                          focusedBorderColor: mainYellow,
                        ),
                        value: selectedMinority,
                        items: minority
                            .map((minority) => DropdownMenuItem(
                                  value: minority,
                                  // Use the actual minority value
                                  child: Text(minority),
                                ))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedMinority = value!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                if (widget.userData == null) ...[
                  const Text('Credentials'),
                  const Divider(),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
                    child: TextFormField(
                      controller: _passwordController,
                      decoration: CustomFormDecoration(
                        borderColor: secondGrey,
                        focusedBorderColor: mainYellow,
                        labelText: 'Password',
                        hintText: 'Enter Password',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Required';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
                    child: TextFormField(
                      controller: _confirmPasswordController,
                      decoration: CustomFormDecoration(
                        borderColor: secondGrey,
                        focusedBorderColor: mainYellow,
                        labelText: 'Confirm Password',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Required';
                        }
                        return null;
                      },
                    ),
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: isChecked, // Current state of the checkbox
                        onChanged: (bool? value) {
                          setState(() {
                            // Update state when checkbox is tapped
                            isChecked = value!;
                          });
                        },
                      ),
                      Expanded(
                        child: Text(
                          'By signing up, you agree to our Terms of Use which explains '
                          'how we collect, use, and store your personal information.',
                          style: CustomTextStyle.primaryBlack,
                        ),
                      ),
                    ],
                  ),
                ],
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 8, 16),
                  child: ElevatedButton(
                    style: longYellow,
                    onPressed: () async {
                      if (widget.userData != null) {
                        if (_formKey.currentState?.validate() ?? false) {
                          setState(() => isLoading = true);
                          final StudentModel studentModel = widget.userData!.copyWith(
                            uid: widget.userData!.uid,
                            academe: _academeController.text,
                            academicProgram: _academicProgramController.text,
                            contactNumber: _contactNumberController.text,
                            firstName: _firstNameController.text,
                            lastName: _lastNameController.text,
                            middleInitial: _middeInitialController.text,
                            studentId: _studentIdController.text,
                            universityEmail: _universityEmailController.text,
                            gender: selectedGender,
                            minority: selectedMinority,
                            isAgreedToTermsOfUse: true,
                          );

                          final encryptedQRValue = await FirestoreController().addOrEditStudentDetails(
                            context,
                            studentModel,
                            isEdit: true,
                          );

                          if (encryptedQRValue != null) {
                            SnackBarController.showSnackBar(context, 'Profile saved successfully');
                            context.router.maybePop();
                          } else {
                            SnackBarController.showSnackBar(context, 'We are unable to process your request. Please try again later');
                          }

                          setState(() => isLoading = false);
                        }
                      } else {
                        if ((_formKey.currentState?.validate() ?? false) && !isChecked) {
                          SnackBarController.clearSnackbars(context);
                          return SnackBarController.showSnackBar(context, 'Please agree to Terms of Use to continue signing up.');
                        }

                        if ((_formKey.currentState?.validate() ?? false) && isChecked) {
                          setState(() => isLoading = true);
                          await AuthController().signUpStudent(
                            context,
                            academe: _academeController.text,
                            academicProgram: _academicProgramController.text,
                            contactNumber: _contactNumberController.text,
                            firstName: _firstNameController.text,
                            lastName: _lastNameController.text,
                            middleInitial: _middeInitialController.text,
                            password: _passwordController.text,
                            studentId: _studentIdController.text,
                            universityEmail: _universityEmailController.text,
                            gender: selectedGender,
                            minority: selectedMinority,
                          );

                          setState(() => isLoading = false);
                        }
                      }
                    }, //attach navigation
                    child: isLoading
                        ? const Center(
                            child: CircularProgressIndicator.adaptive(),
                          )
                        : Text(
                            widget.userData != null ? 'Save and Generate QR Code' : 'Sign Up and Generate QR Code.',
                            style: CustomTextStyle.primaryBlack,
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
