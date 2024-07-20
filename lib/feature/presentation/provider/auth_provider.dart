import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:task/feature/data/models/user_model.dart';
import 'package:task/feature/domain/usecases/login_usecase.dart';
import 'package:task/feature/domain/usecases/logout_usecase.dart';
import 'package:task/feature/domain/usecases/register_usecase.dart';

import '../../data/helpers/hive_helper.dart';

class AuthProvider with ChangeNotifier {
  final LoginUsecase loginUsecase;
  final RegisterUsecase registerUsecase;
  final LogoutUsecase logoutUsecase;

  AuthProvider(this.loginUsecase, this.registerUsecase, this.logoutUsecase) {
    _loadUser();
  }

  UserModel? _user;
  UserModel? get user => _user;

  Future<void> _loadUser() async {
    try {
      final firebaseUser = FirebaseAuth.instance.currentUser;
      if (firebaseUser != null) {
        final email = firebaseUser.email;
        if (email != null) {
          _user = UserModel(email);
          notifyListeners();
        }
      }
    } catch (e) {
      debugPrint('Load user failed: $e');
    }
  }

  Future<void> login(String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      _user = UserModel(email);
      await HiveHelper.saveUser(email);
      notifyListeners();
    } catch (e) {
      debugPrint('Login failed: $e');
      rethrow;
    }
  }

  Future<void> signUp(String email, String password, String rePassword) async {
    try {
      if (password != rePassword) {
        throw Exception('Password diference beetween');
      }
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      _user = UserModel(email);
      await HiveHelper.saveUser(email);
      notifyListeners();
    } catch (e) {
      debugPrint('Register failed: $e');
      rethrow;
    }
  }

  Future<void> logOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      _user = null;
      await HiveHelper.deleteUser();
      notifyListeners();
    } catch (e) {
      debugPrint('Logout failed: $e');
      rethrow;
    }
  }
}
