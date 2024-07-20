import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:task/feature/data/dto/auth_dto.dart';
import 'package:task/feature/data/dto/users_dto.dart';
import 'feature/data/repository/auth_repository_impl.dart';
import 'feature/data/source/local/auth_storage.dart';
import 'feature/data/source/local/local_storage.dart';
import 'feature/domain/entities/auth.dart';
import 'feature/domain/usecases/login_usecases.dart';
import 'feature/domain/usecases/register_usecases.dart';
import 'feature/presentation/app.dart';
import 'feature/presentation/screen/main/provider/user_provider.dart';
import 'feature/presentation/viewmodels/auth_view_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Önce burayı çağırıyoruz
  await Hive.initFlutter();
  Hive.registerAdapter(UserDtoAdapter());
  Hive.registerAdapter(AuthDtoAdapter());
  await Hive.openBox<UserDto>('users');
  await Hive.openBox<Auth>('authV1');

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  final hiveDataSource = HiveUserDataSource();
  final localJsonUserDataSource = LocalStorageImpl();
  final authRepository = AuthRepositoryImpl(
    hiveDataSource: hiveDataSource,
    jsonDataSource: localJsonUserDataSource,
  );

  final loginUseCase = Login(authRepository);
  final registerUseCase = Register(authRepository);
  final authViewModel = AuthViewModel(
    loginUseCase: loginUseCase,
    registerUseCase: registerUseCase,
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider<AuthViewModel>(
          create: (context) => authViewModel,
        ),
      ],
      child: const App(),
    )
  );
}
