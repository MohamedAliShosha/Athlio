import 'package:json_annotation/json_annotation.dart';

part 'sign_up_request_body.g.dart';

@JsonSerializable()
class SignUpRequestBody {
  final String email;
  final String password;
  final String firstName;
  final String lastName;

  SignUpRequestBody(
      {required this.email,
      required this.password,
      required this.firstName,
      required this.lastName});

  Map<String, dynamic> toJson() => _$SignUpRequestBodyToJson(this);
}
