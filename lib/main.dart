import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:task/feature/data/dto/users_dto.dart';
import 'feature/presentation/app.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Önce burayı çağırıyoruz
  await Hive.initFlutter();
  Hive.registerAdapter(UserDtoAdapter());
  await Hive.openBox<UserDto>('users');
  await Hive.openBox("authBox");
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const App());
}
