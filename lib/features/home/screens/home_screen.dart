import 'package:flutter/material.dart';
import 'package:flutter_store_nodjs/components/constans.dart';
import 'package:flutter_store_nodjs/controllers/user_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home-screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      backgroundColor: GlobalVars.brandColor,
      body: Container(
        child: Center(
          child: Text(user.toJson()),
        ),
      ),
    );
  }
}
