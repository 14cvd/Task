import 'package:hive/hive.dart';

class HiveHelper {
  static const String _boxName = 'authBox';

  static Future<void> saveUser(String email) async {
    final box = await Hive.openBox(_boxName);
    await box.put('email', email);
  }

  static Future<String?> getUser() async {
    final box = await Hive.openBox(_boxName);
    return box.get('email');
  }

  static Future<void> deleteUser() async {
    final box = await Hive.openBox(_boxName);
    await box.delete('email');
  }
}
