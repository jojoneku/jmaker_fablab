// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'student_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StudentModel _$StudentModelFromJson(Map<String, dynamic> json) {
  return _StudentModel.fromJson(json);
}

/// @nodoc
mixin _$StudentModel {
  @HiveField(0)
  String get uid => throw _privateConstructorUsedError;
  @HiveField(1)
  String get firstName => throw _privateConstructorUsedError;
  @HiveField(2)
  String get middleInitial => throw _privateConstructorUsedError;
  @HiveField(3)
  String get lastName => throw _privateConstructorUsedError;
  @HiveField(4)
  String get studentId => throw _privateConstructorUsedError;
  @HiveField(5)
  String get contactNumber => throw _privateConstructorUsedError;
  @HiveField(6)
  String get academe => throw _privateConstructorUsedError;
  @HiveField(7)
  String get academicProgram => throw _privateConstructorUsedError;
  @HiveField(8)
  String get universityEmail => throw _privateConstructorUsedError;
  @HiveField(9)
  String get gender => throw _privateConstructorUsedError;
  @HiveField(10)
  String get minority => throw _privateConstructorUsedError;
  @HiveField(11)
  bool get isAgreedToTermsOfUse => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StudentModelCopyWith<StudentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StudentModelCopyWith<$Res> {
  factory $StudentModelCopyWith(
          StudentModel value, $Res Function(StudentModel) then) =
      _$StudentModelCopyWithImpl<$Res, StudentModel>;
  @useResult
  $Res call(
      {@HiveField(0) String uid,
      @HiveField(1) String firstName,
      @HiveField(2) String middleInitial,
      @HiveField(3) String lastName,
      @HiveField(4) String studentId,
      @HiveField(5) String contactNumber,
      @HiveField(6) String academe,
      @HiveField(7) String academicProgram,
      @HiveField(8) String universityEmail,
      @HiveField(9) String gender,
      @HiveField(10) String minority,
      @HiveField(11) bool isAgreedToTermsOfUse});
}

/// @nodoc
class _$StudentModelCopyWithImpl<$Res, $Val extends StudentModel>
    implements $StudentModelCopyWith<$Res> {
  _$StudentModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? firstName = null,
    Object? middleInitial = null,
    Object? lastName = null,
    Object? studentId = null,
    Object? contactNumber = null,
    Object? academe = null,
    Object? academicProgram = null,
    Object? universityEmail = null,
    Object? gender = null,
    Object? minority = null,
    Object? isAgreedToTermsOfUse = null,
  }) {
    return _then(_value.copyWith(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      middleInitial: null == middleInitial
          ? _value.middleInitial
          : middleInitial // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      studentId: null == studentId
          ? _value.studentId
          : studentId // ignore: cast_nullable_to_non_nullable
              as String,
      contactNumber: null == contactNumber
          ? _value.contactNumber
          : contactNumber // ignore: cast_nullable_to_non_nullable
              as String,
      academe: null == academe
          ? _value.academe
          : academe // ignore: cast_nullable_to_non_nullable
              as String,
      academicProgram: null == academicProgram
          ? _value.academicProgram
          : academicProgram // ignore: cast_nullable_to_non_nullable
              as String,
      universityEmail: null == universityEmail
          ? _value.universityEmail
          : universityEmail // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      minority: null == minority
          ? _value.minority
          : minority // ignore: cast_nullable_to_non_nullable
              as String,
      isAgreedToTermsOfUse: null == isAgreedToTermsOfUse
          ? _value.isAgreedToTermsOfUse
          : isAgreedToTermsOfUse // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StudentModelImplCopyWith<$Res>
    implements $StudentModelCopyWith<$Res> {
  factory _$$StudentModelImplCopyWith(
          _$StudentModelImpl value, $Res Function(_$StudentModelImpl) then) =
      __$$StudentModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String uid,
      @HiveField(1) String firstName,
      @HiveField(2) String middleInitial,
      @HiveField(3) String lastName,
      @HiveField(4) String studentId,
      @HiveField(5) String contactNumber,
      @HiveField(6) String academe,
      @HiveField(7) String academicProgram,
      @HiveField(8) String universityEmail,
      @HiveField(9) String gender,
      @HiveField(10) String minority,
      @HiveField(11) bool isAgreedToTermsOfUse});
}

/// @nodoc
class __$$StudentModelImplCopyWithImpl<$Res>
    extends _$StudentModelCopyWithImpl<$Res, _$StudentModelImpl>
    implements _$$StudentModelImplCopyWith<$Res> {
  __$$StudentModelImplCopyWithImpl(
      _$StudentModelImpl _value, $Res Function(_$StudentModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? firstName = null,
    Object? middleInitial = null,
    Object? lastName = null,
    Object? studentId = null,
    Object? contactNumber = null,
    Object? academe = null,
    Object? academicProgram = null,
    Object? universityEmail = null,
    Object? gender = null,
    Object? minority = null,
    Object? isAgreedToTermsOfUse = null,
  }) {
    return _then(_$StudentModelImpl(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      middleInitial: null == middleInitial
          ? _value.middleInitial
          : middleInitial // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      studentId: null == studentId
          ? _value.studentId
          : studentId // ignore: cast_nullable_to_non_nullable
              as String,
      contactNumber: null == contactNumber
          ? _value.contactNumber
          : contactNumber // ignore: cast_nullable_to_non_nullable
              as String,
      academe: null == academe
          ? _value.academe
          : academe // ignore: cast_nullable_to_non_nullable
              as String,
      academicProgram: null == academicProgram
          ? _value.academicProgram
          : academicProgram // ignore: cast_nullable_to_non_nullable
              as String,
      universityEmail: null == universityEmail
          ? _value.universityEmail
          : universityEmail // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      minority: null == minority
          ? _value.minority
          : minority // ignore: cast_nullable_to_non_nullable
              as String,
      isAgreedToTermsOfUse: null == isAgreedToTermsOfUse
          ? _value.isAgreedToTermsOfUse
          : isAgreedToTermsOfUse // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 0, adapterName: 'StudentModelAdapter')
class _$StudentModelImpl implements _StudentModel {
  const _$StudentModelImpl(
      {@HiveField(0) required this.uid,
      @HiveField(1) required this.firstName,
      @HiveField(2) required this.middleInitial,
      @HiveField(3) required this.lastName,
      @HiveField(4) required this.studentId,
      @HiveField(5) required this.contactNumber,
      @HiveField(6) required this.academe,
      @HiveField(7) required this.academicProgram,
      @HiveField(8) required this.universityEmail,
      @HiveField(9) required this.gender,
      @HiveField(10) required this.minority,
      @HiveField(11) this.isAgreedToTermsOfUse = true});

  factory _$StudentModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StudentModelImplFromJson(json);

  @override
  @HiveField(0)
  final String uid;
  @override
  @HiveField(1)
  final String firstName;
  @override
  @HiveField(2)
  final String middleInitial;
  @override
  @HiveField(3)
  final String lastName;
  @override
  @HiveField(4)
  final String studentId;
  @override
  @HiveField(5)
  final String contactNumber;
  @override
  @HiveField(6)
  final String academe;
  @override
  @HiveField(7)
  final String academicProgram;
  @override
  @HiveField(8)
  final String universityEmail;
  @override
  @HiveField(9)
  final String gender;
  @override
  @HiveField(10)
  final String minority;
  @override
  @JsonKey()
  @HiveField(11)
  final bool isAgreedToTermsOfUse;

  @override
  String toString() {
    return 'StudentModel(uid: $uid, firstName: $firstName, middleInitial: $middleInitial, lastName: $lastName, studentId: $studentId, contactNumber: $contactNumber, academe: $academe, academicProgram: $academicProgram, universityEmail: $universityEmail, gender: $gender, minority: $minority, isAgreedToTermsOfUse: $isAgreedToTermsOfUse)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StudentModelImpl &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.middleInitial, middleInitial) ||
                other.middleInitial == middleInitial) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.studentId, studentId) ||
                other.studentId == studentId) &&
            (identical(other.contactNumber, contactNumber) ||
                other.contactNumber == contactNumber) &&
            (identical(other.academe, academe) || other.academe == academe) &&
            (identical(other.academicProgram, academicProgram) ||
                other.academicProgram == academicProgram) &&
            (identical(other.universityEmail, universityEmail) ||
                other.universityEmail == universityEmail) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.minority, minority) ||
                other.minority == minority) &&
            (identical(other.isAgreedToTermsOfUse, isAgreedToTermsOfUse) ||
                other.isAgreedToTermsOfUse == isAgreedToTermsOfUse));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      uid,
      firstName,
      middleInitial,
      lastName,
      studentId,
      contactNumber,
      academe,
      academicProgram,
      universityEmail,
      gender,
      minority,
      isAgreedToTermsOfUse);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StudentModelImplCopyWith<_$StudentModelImpl> get copyWith =>
      __$$StudentModelImplCopyWithImpl<_$StudentModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StudentModelImplToJson(
      this,
    );
  }
}

abstract class _StudentModel implements StudentModel {
  const factory _StudentModel(
      {@HiveField(0) required final String uid,
      @HiveField(1) required final String firstName,
      @HiveField(2) required final String middleInitial,
      @HiveField(3) required final String lastName,
      @HiveField(4) required final String studentId,
      @HiveField(5) required final String contactNumber,
      @HiveField(6) required final String academe,
      @HiveField(7) required final String academicProgram,
      @HiveField(8) required final String universityEmail,
      @HiveField(9) required final String gender,
      @HiveField(10) required final String minority,
      @HiveField(11) final bool isAgreedToTermsOfUse}) = _$StudentModelImpl;

  factory _StudentModel.fromJson(Map<String, dynamic> json) =
      _$StudentModelImpl.fromJson;

  @override
  @HiveField(0)
  String get uid;
  @override
  @HiveField(1)
  String get firstName;
  @override
  @HiveField(2)
  String get middleInitial;
  @override
  @HiveField(3)
  String get lastName;
  @override
  @HiveField(4)
  String get studentId;
  @override
  @HiveField(5)
  String get contactNumber;
  @override
  @HiveField(6)
  String get academe;
  @override
  @HiveField(7)
  String get academicProgram;
  @override
  @HiveField(8)
  String get universityEmail;
  @override
  @HiveField(9)
  String get gender;
  @override
  @HiveField(10)
  String get minority;
  @override
  @HiveField(11)
  bool get isAgreedToTermsOfUse;
  @override
  @JsonKey(ignore: true)
  _$$StudentModelImplCopyWith<_$StudentModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
