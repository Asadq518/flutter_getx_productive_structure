import 'package:get/get.dart';
import 'package:pcom_app/app/routes/app_pages.dart';
import '../../../data/repositories/auth_firebase_repository_impl.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthController extends GetxController {
  final AuthFirebaseRepositoryImpl _authRepository =
      AuthFirebaseRepositoryImpl();

  RxBool isLoading = false.obs;
  Rxn<User> firebaseUser = Rxn<User>();

  @override
  void onInit() {
    super.onInit();
    firebaseUser.bindStream(_authRepository.firebaseAuthStateChanges);
  }

  Future<void> login(String email, String password) async {
    isLoading(true);
    try {
      User? user = await _authRepository.firebaseSignIn(email, password);
      if (user != null) {
        Get.snackbar('Success', 'Logged in as ${user.email}');
        Get.offAllNamed(Routes.HOME);
      } else {
        Get.snackbar('Error', 'No user returned');
      }
    } catch (e) {
      Get.snackbar('Login Error', e.toString());
    } finally {
      isLoading(false);
    }
  }

  Future<void> register(String email, String password) async {
    isLoading(true);
    try {
      User? user = await _authRepository.firebaseRegister(email, password);
      if (user != null) {
        Get.snackbar('Success', 'Registered as ${user.email}');
      } else {
        Get.snackbar('Error', 'No user returned');
      }
    } catch (e) {
      Get.snackbar('Registration Error', e.toString());
    } finally {
      isLoading(false);
    }
  }

  Future<void> resetPassword(String email) async {
    try {
      await _authRepository.firebaseResetPassword(email);
      Get.snackbar('Success', 'Password reset email sent.');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  Future<void> logout() async {
    await _authRepository.firebaseSignOut();
    Get.snackbar('Logged out', 'You have been logged out.');
  }
}
