import 'package:freezed_annotation/freezed_annotation.dart';

part 'maker_model.freezed.dart';
part 'maker_model.g.dart';

@freezed
class MakerModel with _$MakerModel {
  const factory MakerModel({
    required String uid,
    required String firstName,
    required String middleInitial,
    required String lastName,
    required String affiliation,
    required String contactNumber,
    required String userType,
    required String companyName,
    required String email,
    required String gender,
    required String minority,
    @Default(true) bool isAgreedToTermsOfUse,
  }) = _MakerModel;
  factory MakerModel.fromJson(Map<String, dynamic> json) => _$MakerModelFromJson(json);
}
