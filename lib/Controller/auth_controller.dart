// ignore_for_file: use_build_context_synchronously

import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:jmaker_fablab/Controller/firestore_controller.dart';
import 'package:jmaker_fablab/Controller/snackbar_controller.dart';
import 'package:jmaker_fablab/Model/maker_model.dart';
import 'package:jmaker_fablab/Model/student_model.dart';
import 'package:jmaker_fablab/routes/app_router.gr.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class AuthController extends ControllerMVC {
  factory AuthController() => _this ??= AuthController._();
  AuthController._();
  static AuthController? _this;

  String? get userId => FirebaseAuth.instance.currentUser?.uid;

  bool get isVerified => FirebaseAuth.instance.currentUser?.emailVerified ?? false;

  Stream<User?> get authStateChanges => FirebaseAuth.instance.authStateChanges();

  //* Sign Up Student
  Future<void> signUpStudent(
    BuildContext context, {
    required String firstName,
    required String middleInitial,
    required String lastName,
    required String studentId,
    required String contactNumber,
    required String academe,
    required String academicProgram,
    required String universityEmail,
    required String password,
    required String gender,
    required String minority,
  }) async {
    try {
      FirebaseAuth auth = FirebaseAuth.instance;
      await auth.createUserWithEmailAndPassword(email: universityEmail, password: password);

      if (auth.currentUser?.uid != null) {
        await sendEmailVerification(context);

        final StudentModel studentModel = StudentModel(
          uid: auth.currentUser!.uid,
          firstName: firstName,
          middleInitial: middleInitial,
          lastName: lastName,
          studentId: studentId,
          contactNumber: contactNumber,
          academe: academe,
          academicProgram: academicProgram,
          universityEmail: universityEmail,
          gender: gender,
          minority: minority,
        );

        final encryptedQRValue = await FirestoreController().addOrEditStudentDetails(context, studentModel);
        print(encryptedQRValue);
        if (encryptedQRValue != null) {
          SnackBarController.showSnackBar(context, 'Sign up Successful! Check inbox for email verification');

          context.router.replaceAll([StudentQRRoute(name: studentModel.fullName, data: encryptedQRValue)]);
        } else {
          SnackBarController.showSnackBar(context, 'We are unable to process your request. Please try again later');
        }
      } else {
        SnackBarController.showSnackBar(context, 'Something went wrong. Please try again later');
      }
    } on FirebaseAuthException catch (error) {
      if (error.code == 'email-already-in-use') {
        SnackBarController.showSnackBar(context, 'Email already in use');
      } else if (error.code == 'invalid-email') {
        SnackBarController.showSnackBar(context, 'Invalid Email provided');
      } else if (error.code == 'weak-password') {
        SnackBarController.showSnackBar(context, 'Provided password is not strong enough.');
      }
    } catch (e) {
      SnackBarController.showSnackBar(context, 'Something went wrong. Please try again later');
    }
  }

  //* Sign Up Maker
  Future<void> signUpMaker(
    BuildContext context, {
    required String firstName,
    required String middleInitial,
    required String lastName,
    required String contactNumber,
    required String affiliation,
    required String companyName,
    required String email,
    required String password,
    required String gender,
    required String minority,
    required String userType,
  }) async {
    try {
      FirebaseAuth auth = FirebaseAuth.instance;
      await auth.createUserWithEmailAndPassword(email: email, password: password);

      if (auth.currentUser?.uid != null) {
        await sendEmailVerification(context);

        final MakerModel makerModel = MakerModel(
          uid: auth.currentUser!.uid,
          firstName: firstName,
          middleInitial: middleInitial,
          lastName: lastName,
          affiliation: affiliation,
          contactNumber: contactNumber,
          companyName: companyName,
          email: email,
          userType: userType,
          gender: gender,
          minority: minority,
          isAgreedToTermsOfUse: true,
        );

        final encryptedQRValue = await FirestoreController().addOrEditMakerDetails(context, makerModel);

        if (encryptedQRValue != null) {
          SnackBarController.showSnackBar(context, 'Sign up Successful! Check inbox for email verification');

          context.router.replaceAll([MakerQRRoute(name: makerModel.fullName, data: encryptedQRValue)]);
        } else {
          SnackBarController.showSnackBar(context, 'We are unable to process your request. Please try again later');
        }
      } else {
        SnackBarController.showSnackBar(context, 'Something went wrong. Please try again later');
      }
    } on FirebaseAuthException catch (error) {
      if (error.code == 'email-already-in-use') {
        SnackBarController.showSnackBar(context, 'Email already in use');
      } else if (error.code == 'invalid-email') {
        SnackBarController.showSnackBar(context, 'Invalid Email provided');
      } else if (error.code == 'weak-password') {
        SnackBarController.showSnackBar(context, 'Provided password is not strong enough.');
      }
    } catch (e) {
      SnackBarController.showSnackBar(context, 'Something went wrong. Please try again later');
    }
  }

  //* Send email verification
  Future<void> sendEmailVerification(context, {bool isResend = false}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      User? user = auth.currentUser;

      if (user != null) {
        await user.sendEmailVerification();

        if (isResend) {
          SnackBarController.clearSnackbars(context);
          SnackBarController.showSnackBar(context, 'Account Verification sent. Check inbox to verify your account.');
        }
      } else {
        SnackBarController.showSnackBar(context, 'Something went wrong. Please try again later');
      }
    } on FirebaseException catch (error) {
      if (error.code == 'too-many-requests') {
        SnackBarController.showSnackBar(context, 'We are unable to process your request due to multiple request. Please try again later.');
      }
    } catch (e) {
      SnackBarController.showSnackBar(context, 'Something went wrong (${e.toString()}). Please try again later');
    }
  }

  //* Send password reset email
  Future<void> sendPasswordResetEmail(context, String email) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      await auth.sendPasswordResetEmail(email: email);
      SnackBarController.showSnackBar(context, 'Password reset email has been sent successfully.');
    } on FirebaseException catch (error) {
      if (error.code == 'too-many-requests') {
        SnackBarController.showSnackBar(context, 'We are unable to process your request due to multiple request. Please try again later.');
      } else if (error.code == 'invalid-email') {
        SnackBarController.showSnackBar(context, 'Invalid Email provided');
      } else if (error.code == 'user-not-found') {
        SnackBarController.showSnackBar(context, 'Account does not exist!');
      } else {
        SnackBarController.showSnackBar(context, 'We are unable to process your request at the moment. Please try again later.');
      }
    } catch (e) {
      SnackBarController.showSnackBar(context, 'Something went wrong (${e.toString()}). Please try again later');
    }
  }

  //* Sign In
  Future<void> signIn(
    BuildContext context, {
    required String email,
    required String password,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(email: email, password: password);

      User? user = userCredential.user;

      if (user != null && user.emailVerified) {
        SnackBarController.showSnackBar(context, 'Login Successful!');

        final userData = await FirestoreController().getUserDetailsById(context, user.uid);
        if (userData is StudentModel) {
          Hive.box('userData').add(userData);
        } else {
          Hive.box('userData').add(userData as MakerModel);
        }

        context.router.replaceAll([const DashBoardRoute()]);
      } else {
        try {
          SnackBarController.showSnackBarWithActionButton(
            context,
            text: 'Account not verified. Please check your email for verification.',
            onPressed: () => sendEmailVerification(context, isResend: true),
            buttonLabel: 'Resend',
          );
        } catch (error) {
          SnackBarController.showSnackBar(context, error.toString());
        }
      }
    } on FirebaseAuthException catch (error) {
      if (error.code == 'account-exists-with-different-credential') {
        SnackBarController.showSnackBar(context, 'Account exist with different credential');
      } else if (error.code == 'invalid-credential') {
        SnackBarController.showSnackBar(context, 'Invalid credential. Please try again');
      } else if (error.code == 'user-not-found') {
        SnackBarController.showSnackBar(context, 'Account does not exist!');
      } else if (error.code == 'wrong-password') {
        SnackBarController.showSnackBar(context, 'Wrong password provided for that user.');
      } else if (error.code == 'too-many-requests') {
        SnackBarController.showSnackBar(context, 'Too many requests! Try again after a few moments');
      } else {
        SnackBarController.showSnackBar(context, 'Something went wrong (${error.code}). Please try again later');
      }
    } catch (e) {
      SnackBarController.showSnackBar(context, 'Something went wrong (${e.toString()}). Please try again later');
    }
  }

  Future<void> logout(BuildContext context) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      await auth.signOut();
      Hive.box('userData').clear();
      context.router.replaceAll([const LandingRoute()]);
    } catch (e) {
      SnackBarController.showSnackBar(context, 'Something went wrong. Please try again later');
    }
  }
}
