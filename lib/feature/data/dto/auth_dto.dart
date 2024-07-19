// data/models/user_model.dart
import 'package:hive/hive.dart';
import 'package:task/feature/domain/entities/auth.dart';

part 'auth_dto.g.dart';

@HiveType(typeId: 1)
class AuthDto extends Auth {
  @HiveField(0)
  // ignore: annotate_overrides, overridden_fields
  final String email;
  @HiveField(1)
  // ignore: overridden_fields, annotate_overrides
  final String password;

  AuthDto({required this.email, required this.password}) : super(email: email, password: password);

  factory AuthDto.fromJson(Map<String, dynamic> json) {
    return AuthDto(
      email: json['email'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}
