import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'student_model.freezed.dart';
part 'student_model.g.dart';

@freezed
class StudentModel with _$StudentModel {
  @HiveType(typeId: 0, adapterName: 'StudentModelAdapter')
  const factory StudentModel({
    @HiveField(0) required String uid,
    @HiveField(1) required String firstName,
    @HiveField(2) required String middleInitial,
    @HiveField(3) required String lastName,
    @HiveField(4) required String studentId,
    @HiveField(5) required String contactNumber,
    @HiveField(6) required String academe,
    @HiveField(7) required String academicProgram,
    @HiveField(8) required String universityEmail,
    @HiveField(9) required String gender,
    @HiveField(10) required String minority,
    @HiveField(11) @Default(true) bool isAgreedToTermsOfUse,
  }) = _StudentModel;
  factory StudentModel.fromJson(Map<String, dynamic> json) => _$StudentModelFromJson(json);
}

extension StudentModelX on StudentModel {
  String get fullName => '$firstName $middleInitial. $lastName'.toUpperCase();
}
