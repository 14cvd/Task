// data/repositories/user_repository_impl.dart
import 'package:task/feature/data/dto/auth_dto.dart';
import 'package:task/feature/domain/repository/auth_repository.dart';

import '../source/local/auth_storage.dart';
import '../source/local/local_storage.dart';

class AuthRepositoryImpl implements AuthRepository {
  final HiveUserDataSource hiveDataSource;
  final LocalStorageImpl jsonDataSource;

  AuthRepositoryImpl({required this.hiveDataSource, required this.jsonDataSource});

  @override
  Future<bool> login(String email, String password) async {
    // Hive'dan kontrol et
    bool hiveResult = await hiveDataSource.login(email, password);
    if (hiveResult) return true;

    // JSON'dan kontrol et
    List<AuthDto> users = await jsonDataSource.loadAuth();
    AuthDto? user = users.firstWhere(
      (user) => user.email == email && user.password == password,
    );

    // ignore: unnecessary_null_comparison
    return user != null;
  }

  @override
  Future<bool> register(String email, String password) async {
    // JSON dosyasında kayıt yapılmaz, sadece Hive'da kayıt yapılır.
    return hiveDataSource.register(email, password);
  }
}
