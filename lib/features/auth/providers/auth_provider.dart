import 'package:flutter/material.dart';
import '../screens/auth_screen.dart';
import '../services/auth_service.dart';

enum Auth { signin, signup }

class AuthProvider extends ChangeNotifier {
  Auth auth = Auth.signup;
  final signUpFormsKey = GlobalKey<FormState>();
  final signInFormsKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthService authService = AuthService();

  void signUpUser(context) {
    authService.signUpUser(
      name: nameController.text,
      email: emailController.text,
      password: passwordController.text,
      context: context,
    );
  }

  void signinUser(context) {
    authService.signInUser(
      email: emailController.text,
      password: passwordController.text,
      context: context,
    );
  }

  void signOut(BuildContext context) {
    authService.clearAuthToken();
    Navigator.pushNamedAndRemoveUntil(
        context, AuthScreen.routeName, (route) => false);
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
}
