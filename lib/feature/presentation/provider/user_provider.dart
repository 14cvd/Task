import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:task/feature/data/dto/users_dto.dart';

import '../../data/source/local/local_storage.dart';

class UserProvider with ChangeNotifier {
  List<UserDto> _users = [];
  late Box<UserDto> _userBox;

  List<UserDto> get users => _users;

  UserProvider() {
    initHive();
  }

  Future<void> initHive() async {
    try {
      _userBox = await Hive.openBox<UserDto>('users');
      _loadUsersFromHive();
    } catch (e) {
      // Handle error, e.g., show a notification or log it
      debugPrint;('Error opening Hive box: $e');
    }
  }

  void _loadUsersFromHive() {
    _users = _userBox.values.toList();
    notifyListeners();
  }

  Future<void> fetchUsersFromLocalJson() async {
    try {
      final localDataSource = LocalStorageImpl();
      final users = await localDataSource.loadUsersPage();
      await _saveUsersToHive(users);
    } catch (e) {
      // Handle error, e.g., show a notification or log it
      debugPrint('Error fetching users from local JSON: $e');
    }
  }

  Future<void> _saveUsersToHive(List<UserDto> users) async {
    try {
      await _userBox.clear();
      await _userBox.addAll(users);
      _users = users;
      notifyListeners();
    } catch (e) {
      // Handle error, e.g., show a notification or log it
      debugPrint('Error saving users to Hive: $e');
    }
  }

  Future<void> editUser(int index, UserDto newUser) async {
    try {
      _users[index] = newUser;
      await _userBox.putAt(index, newUser);
      notifyListeners();
    } catch (e) {
      // Handle error, e.g., show a notification or log it
      debugPrint('Error editing user in Hive: $e');
    }
  }
}
