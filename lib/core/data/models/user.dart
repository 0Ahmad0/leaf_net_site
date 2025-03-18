import 'package:freezed_annotation/freezed_annotation.dart';

import 'user.dart';


part 'user.freezed.dart';
part 'user.g.dart';

@freezed
// @JsonSerializable(explicitToJson: true)
class UserModel with _$UserModel {
  const UserModel._();

  const factory UserModel({
    int? id,
    @JsonKey(name: 'first_name') String? firstName,
    @JsonKey(name: 'last_name') String? lastName,
    @JsonKey(name: 'username') String? userName,
    @JsonKey(name: 'email') String? email,
    @JsonKey(name: 'image') String? image,


  }) = _UserModel;

  factory UserModel.fromJson( json) => _$UserModelFromJson(json);

  String get completeName => "${firstName ?? ''} ${lastName ?? ''}".trim();
}


