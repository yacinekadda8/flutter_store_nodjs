import 'package:flutter/material.dart';
import 'package:flutter_store_nodjs/features/auth/providers/auth_provider.dart';
import 'package:flutter_store_nodjs/features/home/widgets/costum_btn.dart';
import 'package:provider/provider.dart';

class AdminProfile extends StatelessWidget {
  const AdminProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      body: Center(
        child: CusstomBtn(
          text: "Logout",
          onPressed: () {
            authProvider.signOut(context);
          },
          color: Colors.red,
        ),
      ),
    );
  }
}
