// ignore_for_file: use_build_context_synchronously

import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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

        await FirestoreController().addStudentDetails(context, studentModel);

        SnackBarController.showSnackBar(context, 'Sign up Successful! Check inbox for email verification');
        //TODO  generate qr code later
        context.router.replaceAll([const StudentQRRoute()]); //TODO pass qr code
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

        await FirestoreController().addMakerDetails(context, makerModel);

        SnackBarController.showSnackBar(context, 'Sign up Successful! Check inbox for email verification');
        //TODO  generate qr code later
        context.router.replaceAll([const MakerQRRoute()]); //TODO pass qr code
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
  Future<void> sendEmailVerification(context) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      User? user = auth.currentUser;

      if (user != null) {
        await user.sendEmailVerification();
      } else {
        SnackBarController.showSnackBar(context, 'Something went wrong. Please try again later');
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
        context.router.replaceAll([const DashBoardRoute()]);
      } else {
        try {
          await sendEmailVerification(context);
          SnackBarController.showSnackBar(context, 'Account not verified. Please check your email for verification.');
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

      context.router.replaceAll([const LandingRoute()]);
    } catch (e) {
      SnackBarController.showSnackBar(context, 'Something went wrong. Please try again later');
    }
  }
}
