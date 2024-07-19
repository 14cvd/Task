import '../repository/auth_repository.dart';

class Register {
  final AuthRepository repository;
  Register(this.repository);

  Future<bool> exacute(String email, String password) async {
    return repository.register(email, password);
  }
}
