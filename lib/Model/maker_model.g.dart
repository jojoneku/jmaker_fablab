// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'maker_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MakerModelAdapter extends TypeAdapter<_$MakerModelImpl> {
  @override
  final int typeId = 1;

  @override
  _$MakerModelImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$MakerModelImpl(
      uid: fields[0] as String,
      firstName: fields[1] as String,
      middleInitial: fields[2] as String,
      lastName: fields[3] as String,
      affiliation: fields[4] as String,
      contactNumber: fields[5] as String,
      userType: fields[6] as String,
      companyName: fields[7] as String,
      email: fields[8] as String,
      gender: fields[9] as String,
      minority: fields[10] as String,
      isAgreedToTermsOfUse: fields[11] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, _$MakerModelImpl obj) {
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
      ..write(obj.affiliation)
      ..writeByte(5)
      ..write(obj.contactNumber)
      ..writeByte(6)
      ..write(obj.userType)
      ..writeByte(7)
      ..write(obj.companyName)
      ..writeByte(8)
      ..write(obj.email)
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
      other is MakerModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

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
