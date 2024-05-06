// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:jmaker_fablab/Controller/auth_controller.dart';
import 'package:jmaker_fablab/Controller/snackbar_controller.dart';
import 'package:jmaker_fablab/Model/maker_model.dart';
import 'package:jmaker_fablab/Model/student_model.dart';
import 'package:jmaker_fablab/Utils/encryt_utils.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class FirestoreController extends ControllerMVC {
  factory FirestoreController() => _this ??= FirestoreController._();
  FirestoreController._();
  static FirestoreController? _this;

  //* Add User Details
  Future<String?> addOrEditStudentDetails(BuildContext context, StudentModel studentModel, {bool isEdit = false}) async {
    try {
      if (isEdit) {
        await FirebaseFirestore.instance.collection('students').doc(studentModel.uid).update(studentModel.toJson());

        await Hive.box('userData').clear();
        await Hive.box('userData').add(studentModel);
      } else {
        await FirebaseFirestore.instance.collection('students').doc(studentModel.uid).set(studentModel.toJson());
      }
      final encodedModel = jsonEncode(studentModel.toJson());
      final encrypted = EncryptUtils.encrypt(studentModel.uid, encodedModel);

      return '${studentModel.uid}${encrypted.base64}';
    } catch (e) {
      SnackBarController.showSnackBar(context, e.toString());

      return null;
    }
  }

  Future<String?> addOrEditMakerDetails(BuildContext context, MakerModel makerModel, {bool isEdit = false}) async {
    try {
      if (isEdit) {
        await FirebaseFirestore.instance.collection('makers').doc(makerModel.uid).update(makerModel.toJson());

        await Hive.box('userData').clear();
        await Hive.box('userData').add(makerModel);
      } else {
        await FirebaseFirestore.instance.collection('makers').doc(makerModel.uid).set(makerModel.toJson());
      }
      final encodedModel = jsonEncode(makerModel.toJson());
      final encrypted = EncryptUtils.encrypt(makerModel.uid, encodedModel);

      return encrypted.base64;
    } catch (e) {
      SnackBarController.showSnackBar(context, e.toString());
      return null;
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

  //* Get User Details
  Future<dynamic> getUserDetailsById(BuildContext context, String uid) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    try {
      final DocumentSnapshot docSnap = await firestore.collection('students').doc(uid).get();
      if (docSnap.exists) {
        return StudentModel.fromJson(docSnap.data() as Map<String, dynamic>);
      } else {
        final DocumentSnapshot docSnap = await firestore.collection('makers').doc(uid).get();

        if (docSnap.exists) {
          return MakerModel.fromJson(docSnap.data() as Map<String, dynamic>);
        }

        await AuthController().logout(context);
        return null;
      }
    } catch (e) {
      SnackBarController.showSnackBar(context, e.toString());
      return null;
    }
  }
}
