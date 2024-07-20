// data/repositories/auth_repository_impl.dart
import 'package:firebase_auth/firebase_auth.dart';
import '../../domain/repositories/auth_repository.dart';
import '../models/user_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<UserModel?> login(String email, String password) async {
    try {
      final result = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return UserModel.fromFirebaseUser(result.user);
    } catch (e) {
      // Handle specific FirebaseAuthException if needed
      rethrow;
    }
  }

  @override
  Future<UserModel?> signUp(String email, String password, String rePassword) async {
    try {
      if (password != rePassword) {
        throw Exception('Passwords do not match');
      }
      final result = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      return UserModel.fromFirebaseUser(result.user);
    } catch (e) {
      // Handle specific FirebaseAuthException if needed
      rethrow;
    }
  }

  @override
  Future<void> logOut() async {
    await _firebaseAuth.signOut();
  }
}
