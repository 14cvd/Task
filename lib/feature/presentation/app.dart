import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:task/feature/presentation/screen/main/main.dart';

import '../../common/constant/size.dart';
import '../../common/constant/theme.dart';
import '../data/repository/auth_repository_impl.dart';
import '../domain/usecases/login_usecase.dart';
import '../domain/usecases/logout_usecase.dart';
import '../domain/usecases/register_usecase.dart';
import 'provider/auth_provider.dart';
import 'provider/user_provider.dart';
import 'screen/login/login.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final userRepository = AuthRepositoryImpl();
    final login = LoginUsecase(userRepository);
    final register = RegisterUsecase(userRepository);
    final logout = LogoutUsecase(userRepository);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => AuthProvider(login, register, logout),
        )
      ],
      child: ScreenUtilInit(
        designSize: Size(AppSize.width, AppSize.height),
        child: Consumer<AuthProvider>(
          builder: (context, authProvider, child) {
            debugPrint("auth provider ${authProvider.user}");
            return MaterialApp(
              theme: AppTheme.appTheme,
              debugShowCheckedModeBanner: false,
              home: authProvider.user == null ? const LoginScreen() : const MainScreen(),
            );
          },
        ),
      ),
    );
  }
}
