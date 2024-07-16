import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:task/feature/data/dto/users_dto.dart';
import 'package:task/feature/presentation/app.dart';

import 'feature/presentation/screen/main/provider/user_provider.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(UserDtoAdapter());
  await Hive.openBox<UserDtoAdapter>('taskV1');
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => UserProvider()),
    ],
    child: const App(),
  ));
}
