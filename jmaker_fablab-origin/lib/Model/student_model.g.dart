// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StudentModelAdapter extends TypeAdapter<_$StudentModelImpl> {
  @override
  final int typeId = 0;

  @override
  _$StudentModelImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$StudentModelImpl(
      uid: fields[0] as String,
      firstName: fields[1] as String,
      middleInitial: fields[2] as String,
      lastName: fields[3] as String,
      studentId: fields[4] as String,
      contactNumber: fields[5] as String,
      academe: fields[6] as String,
      academicProgram: fields[7] as String,
      universityEmail: fields[8] as String,
      gender: fields[9] as String,
      minority: fields[10] as String,
      isAgreedToTermsOfUse: fields[11] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, _$StudentModelImpl obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.uid)
      ..writeByte(1)
      ..write(obj.firstName)
      ..writeByte(2)
      ..write(obj.middleInitial)
      ..writeByte(3)
      ..write(obj.lastName)
      ..writeByte(4)
      ..write(obj.studentId)
      ..writeByte(5)
      ..write(obj.contactNumber)
      ..writeByte(6)
      ..write(obj.academe)
      ..writeByte(7)
      ..write(obj.academicProgram)
      ..writeByte(8)
      ..write(obj.universityEmail)
      ..writeByte(9)
      ..write(obj.gender)
      ..writeByte(10)
      ..write(obj.minority)
      ..writeByte(11)
      ..write(obj.isAgreedToTermsOfUse);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StudentModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

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
