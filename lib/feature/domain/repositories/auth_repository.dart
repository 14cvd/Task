// domain/repository/auth_repository.dart

import '../../data/models/user_model.dart';

abstract class AuthRepository {
  Future<UserModel?> login(String email, String password);
  Future<UserModel?> signUp(String email, String password, String rePassword);
  Future<void> logOut();
}
