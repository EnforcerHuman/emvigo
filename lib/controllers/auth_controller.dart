import 'package:machine_task/services/firebase_servicde.dart';

class AuthController {
  final FirebaseAuthService _authService;

  AuthController({required FirebaseAuthService firebaseAuthService})
    : _authService = firebaseAuthService;

  Future<bool> signIn(String email, String password) async {
    try {
      await _authService.signInWithEmailAndPassword(email, password);
      return true;
    } catch (e) {
      // Handle sign-in error
      return false;
    }
  }

  Future<bool> signUp(String email, String password) async {
    try {
      await _authService.createUserWithEmailAndPassword(email, password);
      return true;
      // Handle successful sign-up
    } catch (e) {
      // Handle sign-up error
      return false;
      print('Sign-up error: $e');
    }
  }

  Future<void> signOut() async {
    try {
      await _authService.signOut();
      // Handle successful sign-out
    } catch (e) {
      // Handle sign-out error
      print('Sign-out error: $e');
    }
  }
}
