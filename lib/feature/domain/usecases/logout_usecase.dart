import 'package:task/feature/domain/repositories/auth_repository.dart';

class LogoutUsecase {
  final AuthRepository repository;
  LogoutUsecase(this.repository);
  Future<void> execute() async {
    await repository.logOut();
  }
}
