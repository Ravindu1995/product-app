import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:product_app/data/services/auth_service.dart';

class AuthController extends GetxController {
  final AuthService _authService = AuthService();
  var user = Rx<User?>(null);

  @override
  void onInit() {
    user.value = _authService.currentUser;
    super.onInit();
  }

  Future<void> signInWithGoogle() async {
    try {
      User? userCredential = await _authService.signInWithGoogle();
      if (userCredential != null) {
        user.value = userCredential;
        Get.snackbar('Success', 'Logged in as ${userCredential.displayName}');
      } else {
        Get.snackbar('Error', 'Google Sign-In failed');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to sign in: $e');
    }
  }

  Future<void> signOut() async {
    try {
      await _authService.signOut();
      user.value = null;
      Get.snackbar('Success', 'Signed out successfully');
    } catch (e) {
      Get.snackbar('Error', 'Failed to sign out: $e');
    }
  }

  bool get isSignedIn => user.value != null;
}
