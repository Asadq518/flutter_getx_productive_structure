import 'package:firebase_auth/firebase_auth.dart';
import '../models/user_model.dart';
import '../services/auth_service.dart';
import 'auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthService _authService = AuthService();

  // Secure storage methods
  @override
  Future<void> saveUserData(Map<String, dynamic> user, String token) =>
      _authService.saveUserData(user, token);

  @override
  Future<UserModel?> getUserData() => _authService.getUserData();

  @override
  Future<String?> getToken() => _authService.getToken();

  @override
  Future<bool> isLoggedIn() => _authService.isLoggedIn();

  @override
  Future<void> logout() => _authService.logout();

  // Firebase methods
  @override
  Future<User?> firebaseSignIn(String email, String password) =>
      _authService.firebaseSignIn(email, password);

  @override
  Future<User?> firebaseRegister(String email, String password) =>
      _authService.firebaseRegister(email, password);

  @override
  Future<void> firebaseResetPassword(String email) =>
      _authService.firebaseResetPassword(email);

  @override
  Future<void> firebaseSignOut() => _authService.firebaseSignOut();

  @override
  User? get firebaseCurrentUser => _authService.firebaseCurrentUser;

  @override
  Stream<User?> get firebaseAuthStateChanges =>
      _authService.firebaseAuthStateChanges;
}
