import 'package:flutter/material.dart';
import 'package:task/feature/domain/entities/auth.dart';

import '../../domain/usecases/login_usecases.dart';
import '../../domain/usecases/register_usecases.dart';

class AuthViewModel extends ChangeNotifier {
  final Login loginUseCase;
  final Register registerUseCase;

  Auth? _currentUser;
  Auth? get currentUser => _currentUser;

  AuthViewModel({required this.loginUseCase, required this.registerUseCase});

  Future<bool> login(String email, String password) async {
    final success = await loginUseCase.execute(email, password);
    if (success) {
      _currentUser = Auth(email: email, password: password);
    }
    notifyListeners();
    return success;
  }

  Future<bool> register(String email, String password) async {
    final success = await registerUseCase.exacute(email, password);
    notifyListeners();
    return success;
  }

  void logout() {
    _currentUser = null;
    notifyListeners();
  }
}
