import 'package:task/feature/data/models/user_model.dart';

import '../repositories/auth_repository.dart';

class LoginUsecase {
  final AuthRepository repository;
  LoginUsecase(this.repository);
  Future<UserModel?> execute(String email, String password) async {
    return await repository.login(email, password);
  }
}
