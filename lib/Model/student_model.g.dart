// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StudentModelImpl _$$StudentModelImplFromJson(Map<String, dynamic> json) =>
    _$StudentModelImpl(
      uid: json['uid'] as String,
      firstName: json['firstName'] as String,
      middleInitial: json['middleInitial'] as String,
      lastName: json['lastName'] as String,
      studentId: json['studentId'] as String,
      contactNumber: json['contactNumber'] as String,
      academe: json['academe'] as String,
      academicProgram: json['academicProgram'] as String,
      universityEmail: json['universityEmail'] as String,
      gender: json['gender'] as String,
      minority: json['minority'] as String,
      isAgreedToTermsOfUse: json['isAgreedToTermsOfUse'] as bool? ?? true,
    );

Map<String, dynamic> _$$StudentModelImplToJson(_$StudentModelImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'firstName': instance.firstName,
      'middleInitial': instance.middleInitial,
      'lastName': instance.lastName,
      'studentId': instance.studentId,
      'contactNumber': instance.contactNumber,
      'academe': instance.academe,
      'academicProgram': instance.academicProgram,
      'universityEmail': instance.universityEmail,
      'gender': instance.gender,
      'minority': instance.minority,
      'isAgreedToTermsOfUse': instance.isAgreedToTermsOfUse,
    };
