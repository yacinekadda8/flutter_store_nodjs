import 'package:flutter/material.dart';
import 'package:flutter_store_nodjs/features/auth/providers/auth_provider.dart';
import 'package:provider/provider.dart';

import '../../../common/widgets/custom_button.dart';
import '../../../common/widgets/custom_textfield.dart';
import '../../../components/constans.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});
  static const String routeName = "/auth-screen";
  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      backgroundColor: MyConstans.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Welcome',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
              ListTile(
                tileColor: authProvider.auth == Auth.signup
                    ? MyConstans.background
                    : null,
                title: const Text(
                  'Create Account',
                ),
                leading: Radio(
                  activeColor: MyConstans.redColorMain,
                  value: Auth.signup,
                  groupValue: authProvider.auth,
                  onChanged: (Auth? value) {
                    setState(() {
                      authProvider.auth = value!;
                    });
                  },
                ),
              ),
              if (authProvider.auth == Auth.signup)
                Container(
                  padding: const EdgeInsets.all(8),
                  color: MyConstans.background,
                  child: Form(
                    key: authProvider.signUpFormsKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        CustomTextField(
                          controller: authProvider.nameController,
                          hintText: "Name",
                        ),
                        const SizedBox(height: 10),
                        CustomTextField(
                          controller: authProvider.emailController,
                          hintText: "Email",
                        ),
                        const SizedBox(height: 10),
                        CustomTextField(
                          controller: authProvider.passwordController,
                          hintText: "Password",
                        ),
                        const SizedBox(height: 10),
                        CustomButton(
                          text: "Sign Up",
                          onPressed: () {
                            if (authProvider.signUpFormsKey.currentState!
                                .validate()) {
                              authProvider.signUpUser(context);
                            }
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ListTile(
                tileColor: authProvider.auth == Auth.signin
                    ? MyConstans.background
                    : null,
                title: const Text(
                  'Login',
                ),
                leading: Radio(
                  activeColor: MyConstans.redColorMain,
                  value: Auth.signin,
                  groupValue: authProvider.auth,
                  onChanged: (Auth? value) {
                    setState(() {
                      authProvider.auth = value!;
                    });
                  },
                ),
              ),
              if (authProvider.auth == Auth.signin)
                Container(
                  padding: const EdgeInsets.all(8),
                  color: MyConstans.background,
                  child: Form(
                    key: authProvider.signInFormsKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        CustomTextField(
                          controller: authProvider.emailController,
                          hintText: "Email",
                        ),
                        const SizedBox(height: 10),
                        CustomTextField(
                          controller: authProvider.passwordController,
                          hintText: "Password",
                        ),
                        const SizedBox(height: 10),
                        CustomButton(
                          text: "Sign In",
                          onPressed: () {
                            if (authProvider.signInFormsKey.currentState!
                                .validate()) {
                              authProvider.signinUser(context);
                            }
                          },
                        )
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
