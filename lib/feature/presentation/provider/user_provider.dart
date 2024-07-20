import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:task/feature/data/dto/users_dto.dart';

import '../../data/source/local/local_storage.dart';

class UserProvider with ChangeNotifier {
  List<UserDto> _users = [];

  List<UserDto> get users => _users;

  UserProvider() {
    _loadUsersFromHive();
  }

  void _loadUsersFromHive() async {
    final box = await Hive.openBox<UserDto>('users');
    _users = box.values.toList();
    notifyListeners();
  }

  Future<void> fetchUsersFromLocalJson() async {
    final localDataSource = LocalStorageImpl();
    final users = await localDataSource.loadUsersPage();
    _saveUsersToHive(users);
  }

  void _saveUsersToHive(List<UserDto> users) async {
    final box = await Hive.openBox<UserDto>('users');
    await box.clear();
    for (var user in users) {
      await box.add(user);
    }
    _users = users;
    notifyListeners();
  }

  Future<void> editUser(int index, UserDto newUser) async {
    final box = await Hive.openBox<UserDto>('users');
    _users[index] = newUser;
    await box.putAt(index, newUser);
    notifyListeners();
  }
}
