import 'package:task/feature/data/models/user_model.dart';
import '../repositories/auth_repository.dart';

class RegisterUsecase {
  final AuthRepository repository;
  RegisterUsecase(this.repository);
  Future<UserModel?> execute(String email, String password, String rePassword) async {
    if (password != rePassword) {
      throw Exception('Passwords do not match');
    }
    return await repository.signUp(email, password, rePassword);
  }
}
