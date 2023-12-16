import 'package:flutter/material.dart';
import 'package:flutter_store_nodjs/common/widgets/custom_button.dart';
import 'package:flutter_store_nodjs/features/auth/providers/auth_provider.dart';
import 'package:flutter_store_nodjs/features/auth/services/auth_service.dart';
import 'package:flutter_store_nodjs/providers/user_provider.dart';
import 'package:provider/provider.dart';
import '../widgets/account_appbar.dart';
import '../widgets/orders.dart';
import '../widgets/top_buttons.dart';
import '../widgets/user_info.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context).user;
    final authProvider = Provider.of<AuthProvider>(context);
    return SizedBox(
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const AccountAppBar(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                const SizedBox(height: 10),
                UserInfo(userProvider: userProvider),
                const SizedBox(height: 10),
                const TopButtons(),
                const SizedBox(height: 20),
                const Orders(),
                const SizedBox(height: 20),
                CustomButton(
                  text: "Sign out",
                  onPressed: () {
                    authProvider.signOut(context);
                    // Optionally, you can add additional logic or UI updates after clearing the token.
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
