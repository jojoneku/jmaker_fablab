import 'package:freezed_annotation/freezed_annotation.dart';

part 'student_model.freezed.dart';
part 'student_model.g.dart';

@freezed
class StudentModel with _$StudentModel {
  const factory StudentModel({
    required String uid,
    required String firstName,
    required String middleInitial,
    required String lastName,
    required String studentId,
    required String contactNumber,
    required String academe,
    required String academicProgram,
    required String universityEmail,
    required String gender,
    required String minority,
    @Default(true) bool isAgreedToTermsOfUse,
  }) = _StudentModel;
  factory StudentModel.fromJson(Map<String, dynamic> json) => _$StudentModelFromJson(json);
}
