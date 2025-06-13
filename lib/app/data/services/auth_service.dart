import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';

import 'package:pcom_app/app/data/models/user_model.dart';

import '../../core/core.dart';

import 'package:firebase_auth/firebase_auth.dart';


class AuthService {
  static final String _userKey = MyConstants.userData;
  static final String _tokenKey = MyConstants.token;

  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  /// Save user info and token securely
  Future<void> saveUserData(Map<String, dynamic> user, String token) async {
    final userJson = jsonEncode(user);
    await _storage.write(key: _userKey, value: userJson);
    await _storage.write(key: _tokenKey, value: token);
  }

  /// Get user data as Map
  Future<UserModel?> getUserData() async {
    final userJson = await _storage.read(key: _userKey);
    if (userJson != null) {
      final map = jsonDecode(userJson);
      return UserModel.fromJson(map);
    }
    return null;
  }

  /// Get auth token
  Future<String?> getToken() async {
    return await _storage.read(key: _tokenKey);
  }

  /// Check if user is logged in
  Future<bool> isLoggedIn() async {
    final token = await getToken();
    return token != null;
  }

  /// Logout user (clear secure storage)
  Future<void> logout() async {
    await _storage.deleteAll();
    await firebaseSignOut();
  }

  /// New Firebase Authentication Methods ///

  /// Sign In with Email & Password (Firebase)
  Future<User?> firebaseSignIn(String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    }
  }

  /// Register with Email & Password (Firebase)
  Future<User?> firebaseRegister(String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    }
  }

  /// Reset Password (Firebase)
  Future<void> firebaseResetPassword(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    }
  }

  /// Firebase sign out
  Future<void> firebaseSignOut() async {
    await _firebaseAuth.signOut();
  }

  /// Get Firebase current user
  User? get firebaseCurrentUser => _firebaseAuth.currentUser;

  /// Firebase auth state changes
  Stream<User?> get firebaseAuthStateChanges => _firebaseAuth.authStateChanges();
}
