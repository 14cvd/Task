import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:task/feature/data/dto/users_dto.dart';

abstract class LocalStorage {
  Future<List<UserDto>> loadUsersPage();
}

class LocalStorageImpl implements LocalStorage {
  @override
  Future<List<UserDto>> loadUsersPage() async {
    final String response = await rootBundle.loadString('asset/data/users.json');
    List<dynamic> jsonData = json.decode(response);
    return jsonData.map((json) => UserDto.fromJson(json)).toList();
  }
}
