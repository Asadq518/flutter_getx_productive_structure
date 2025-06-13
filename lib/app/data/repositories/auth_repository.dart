
import 'package:firebase_auth/firebase_auth.dart';

import '../models/user_model.dart';

abstract class AuthRepository {
  // Secure storage methods
  Future<void> saveUserData(Map<String, dynamic> user, String token);
  Future<UserModel?> getUserData();
  Future<String?> getToken();
  Future<bool> isLoggedIn();
  Future<void> logout();

  // Firebase methods
  Future<User?> firebaseSignIn(String email, String password);
  Future<User?> firebaseRegister(String email, String password);
  Future<void> firebaseResetPassword(String email);
  Future<void> firebaseSignOut();
  User? get firebaseCurrentUser;
  Stream<User?> get firebaseAuthStateChanges;
}
