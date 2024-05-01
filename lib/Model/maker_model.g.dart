// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'maker_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MakerModelImpl _$$MakerModelImplFromJson(Map<String, dynamic> json) =>
    _$MakerModelImpl(
      uid: json['uid'] as String,
      firstName: json['firstName'] as String,
      middleInitial: json['middleInitial'] as String,
      lastName: json['lastName'] as String,
      affiliation: json['affiliation'] as String,
      contactNumber: json['contactNumber'] as String,
      userType: json['userType'] as String,
      companyName: json['companyName'] as String,
      email: json['email'] as String,
      gender: json['gender'] as String,
      minority: json['minority'] as String,
      isAgreedToTermsOfUse: json['isAgreedToTermsOfUse'] as bool? ?? true,
    );

Map<String, dynamic> _$$MakerModelImplToJson(_$MakerModelImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'firstName': instance.firstName,
      'middleInitial': instance.middleInitial,
      'lastName': instance.lastName,
      'affiliation': instance.affiliation,
      'contactNumber': instance.contactNumber,
      'userType': instance.userType,
      'companyName': instance.companyName,
      'email': instance.email,
      'gender': instance.gender,
      'minority': instance.minority,
      'isAgreedToTermsOfUse': instance.isAgreedToTermsOfUse,
    };
