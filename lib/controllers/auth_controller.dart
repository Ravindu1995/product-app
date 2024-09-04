import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:product_app/app/routes/routes_name.dart';
import 'package:product_app/data/services/auth_service.dart';

class AuthController extends GetxController {
  final AuthService _authService = AuthService();
  var user = Rx<User?>(null);

  @override
  void onInit() {
    user.value = _authService.currentUser;
    super.onInit();
  }

  // Sign-In
  Future<void> signInWithGoogle() async {
    try {
      User? userCredential = await _authService.signInWithGoogle();
      if (userCredential != null) {
        user.value = userCredential;
        Get.snackbar(
            'Login Successful', 'Logged in as ${userCredential.displayName}');
        Get.offAllNamed(Routes.homeView);
      } else {
        Get.snackbar('Login Error', 'Google Sign-In failed');
      }
    } catch (e) {
      Get.snackbar('Login Error', 'Failed to sign in: $e');
    }
  }

  // Sign out
  Future<void> signOut() async {
    try {
      await _authService.signOut();
      user.value = null;

      Get.snackbar('Success', 'Signed out successfully');
      Get.offAllNamed(Routes.loginView);
    } catch (e) {
      Get.snackbar('Error', 'Failed to sign out: $e');
    }
  }

  bool get isSignedIn => user.value != null;
}
