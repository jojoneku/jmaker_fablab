// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jmaker_fablab/Controller/auth_controller.dart';
import 'package:jmaker_fablab/Controller/snackbar_controller.dart';
import 'package:jmaker_fablab/Model/maker_model.dart';
import 'package:jmaker_fablab/Model/student_model.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class FirestoreController extends ControllerMVC {
  factory FirestoreController() => _this ??= FirestoreController._();
  FirestoreController._();
  static FirestoreController? _this;

  //* Add User Details
  Future<void> addStudentDetails(BuildContext context, StudentModel studentModel) async {
    try {
      await FirebaseFirestore.instance.collection('students').doc(studentModel.uid).set(studentModel.toJson());
    } catch (e) {
      SnackBarController.showSnackBar(context, e.toString());
    }
  }

  Future<void> addMakerDetails(BuildContext context, MakerModel makerModel) async {
    try {
      await FirebaseFirestore.instance.collection('makers').doc(makerModel.uid).set(makerModel.toJson());
    } catch (e) {
      SnackBarController.showSnackBar(context, e.toString());
    }
  }

  //* Get Student Details
  Future<StudentModel?> getStudentDetailsById(BuildContext context, String uid) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    try {
      final DocumentSnapshot docSnap = await firestore.collection('students').doc(uid).get();
      if (docSnap.exists) {
        return StudentModel.fromJson(docSnap.data() as Map<String, dynamic>);
      } else {
        await AuthController().logout(context);
        return null;
      }
    } catch (e) {
      SnackBarController.showSnackBar(context, e.toString());
      return null;
    }
  }
}
