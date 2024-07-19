
import '../repository/auth_repository.dart';

class Login {
  final AuthRepository repository;
  Login(this.repository);

  Future<bool> execute(String email, String password) async {
    return repository.login(email, password);
  }
}
