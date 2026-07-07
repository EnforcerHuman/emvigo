import 'package:machine_task/services/firebase_servicde.dart';

class AuthController {
  // Add your authentication logic here

  final FirebaseAuthService _authService = FirebaseAuthService();

  Future<void> signIn(String email, String password) async {
    try {
      await _authService.signInWithEmailAndPassword(email, password);
      // Handle successful sign-in
    } catch (e) {
      // Handle sign-in error
      print('Sign-in error: $e');
    }
  }

  Future<void> signUp(String email, String password) async {
    try {
      await _authService.createUserWithEmailAndPassword(email, password);
      // Handle successful sign-up
    } catch (e) {
      // Handle sign-up error
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
