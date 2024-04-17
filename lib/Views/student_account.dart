import 'package:flutter/material.dart';
import 'package:jmaker_fablab/Views/account_type.dart';
import 'package:jmaker_fablab/Views/studentQR.dart';
import 'package:jmaker_fablab/styles/text_style.dart';
import '../styles/buttons.dart';
import '../styles/color.dart';
import 'package:jmaker_fablab/styles/formStyles.dart';

class StudentAccount extends StatefulWidget {
  const StudentAccount({super.key});

  @override
  State<StudentAccount> createState() => _StudentAccountState();
}

class _StudentAccountState extends State<StudentAccount> {
  List<String> gender = ['Male', 'Female', 'LGBTQ+', 'Prefer not to Say'];
  List<String> minority = ['Youth', 'PWD', 'Senior Citizen+'];
  String selectedGender = 'Male';
  String selectedMinority = 'Youth';
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteBG,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        children: [
                          FloatingActionButton(
                            backgroundColor: whiteBG,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            elevation: 0,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const AccountType()),
                              );
                            },
                            child: const Icon(
                              Icons.arrow_back_ios_new,
                              color:
                                  blackGreen, // Used color property for icon color
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              'Signing Up as a Student',
                              style: CustomTextStyle.boldHeader,
                            ),
                            Text(
                              "Let's build your profile now!",
                              style: CustomTextStyle.secondaryGrey,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Image.asset(
                      'assets/images/student_icon.png',
                      fit: BoxFit.contain,
                      height: 50,
                      width: 40,
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                const Align(
                    alignment: Alignment.topLeft,
                    child: Text('Student Information')),
                const Divider(),
                const SizedBox(
                  height: 16,
                ),
                //FirstNameMI
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: TextFormField(
                        decoration: CustomFormDecoration(
                          borderColor: secondGrey,
                          focusedBorderColor: mainYellow,
                          labelText: 'First Name',
                          hintText: 'Enter your first name.',
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      flex: 1,
                      child: TextFormField(
                        decoration: CustomFormDecoration(
                          borderColor: secondGrey,
                          focusedBorderColor: mainYellow,
                          labelText: 'M.I.',
                          hintText: 'Initial',
                        ),
                      ),
                    ),
                  ],
                ),
                //Lastname
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
                  child: TextFormField(
                    decoration: CustomFormDecoration(
                      borderColor: secondGrey,
                      focusedBorderColor: mainYellow,
                      labelText: 'Last Name',
                      hintText: 'Enter your last name.',
                    ),
                  ),
                ),
                //studentID
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: CustomFormDecoration(
                          borderColor: secondGrey,
                          focusedBorderColor: mainYellow,
                          labelText: 'Student ID',
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      flex: 3,
                      child: TextFormField(
                        keyboardType: TextInputType.phone,
                        decoration: CustomFormDecoration(
                          borderColor: secondGrey,
                          focusedBorderColor: mainYellow,
                          labelText: 'Contact Number',
                          hintText: 'Enter contact number.',
                        ),
                      ),
                    ),
                  ],
                ),
                //Academe
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
                  child: TextFormField(
                    decoration: CustomFormDecoration(
                      borderColor: secondGrey,
                      focusedBorderColor: mainYellow,
                      labelText: 'Academe',
                      hintText: 'Name of affiliated university.',
                    ),
                  ),
                ),
                //Program
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
                  child: TextFormField(
                    decoration: CustomFormDecoration(
                      borderColor: secondGrey,
                      focusedBorderColor: mainYellow,
                      labelText: 'Academic Program',
                      hintText: 'Enter your program.',
                    ),
                  ),
                ),
                //University Email
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: CustomFormDecoration(
                      borderColor: secondGrey,
                      focusedBorderColor: mainYellow,
                      labelText: 'University Email',
                      hintText: 'Enter your email.',
                    ),
                  ),
                ),
                const Align(
                    alignment: Alignment.topLeft,
                    child: Text('Disaggregiation')),
                const Divider(),
                const SizedBox(
                  height: 16,
                ),
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
                const Align(
                    alignment: Alignment.topLeft, child: Text('Credentials')),
                const Divider(),
                const SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
                  child: TextFormField(
                    decoration: CustomFormDecoration(
                      borderColor: secondGrey,
                      focusedBorderColor: mainYellow,
                      labelText: 'Password',
                      hintText: 'Enter Password',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
                  child: TextFormField(
                    decoration: CustomFormDecoration(
                      borderColor: secondGrey,
                      focusedBorderColor: mainYellow,
                      labelText: 'Confirm Password',
                    ),
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
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 8, 16),
                  child: Expanded(
                    child: ElevatedButton(
                      style: longYellow,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => StudentQR()),
                        );
                      }, //attach navigation
                      child: Text(
                        'Sign Up and Generate QR Code.',
                        style: CustomTextStyle.primaryBlack,
                      ),
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
