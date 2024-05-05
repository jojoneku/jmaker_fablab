import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'maker_model.freezed.dart';
part 'maker_model.g.dart';

@freezed
class MakerModel with _$MakerModel {
  @HiveType(typeId: 1, adapterName: 'MakerModelAdapter')
  const factory MakerModel({
    @HiveField(0) required String uid,
    @HiveField(1) required String firstName,
    @HiveField(2) required String middleInitial,
    @HiveField(3) required String lastName,
    @HiveField(4) required String affiliation,
    @HiveField(5) required String contactNumber,
    @HiveField(6) required String userType,
    @HiveField(7) required String companyName,
    @HiveField(8) required String email,
    @HiveField(9) required String gender,
    @HiveField(10) required String minority,
    @HiveField(11) @Default(true) bool isAgreedToTermsOfUse,
  }) = _MakerModel;
  factory MakerModel.fromJson(Map<String, dynamic> json) => _$MakerModelFromJson(json);
}

extension MakerModelX on MakerModel {
  String get fullName => '$firstName $middleInitial. $lastName'.toUpperCase();
}
