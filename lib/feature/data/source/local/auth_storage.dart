import 'package:hive/hive.dart';
import 'package:task/feature/domain/entities/auth.dart';

class HiveUserDataSource {
  Box<Auth> userBox = Hive.box<Auth>('authV1');

  Future<bool> login(String username, String password) async {
    Auth? auth = userBox.values.firstWhere(
      (user) => user.email == username && user.password == password,
      orElse: () => Auth(email: username, password: password),
    );

    return auth.email == username && auth.password == password;
  }

  Future<bool> register(String username, String password) async {
    if (userBox.values.any((user) => user.email == username)) {
      return false;
    } else {
      userBox.add(Auth(email: username, password: password));
      return true;
    }
  }
}
