// data/model/user_model.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:task/feature/domain/entities/auth.dart';

class UserModel {
  final String email;

  UserModel(this.email);

  Auth toEntity() {
    return Auth(email);
  }

  static UserModel fromFirebaseUser(User? user) {
    if (user == null) {
      throw Exception('Firebase user is null');
    }
    return UserModel(user.email!);
  }
}
