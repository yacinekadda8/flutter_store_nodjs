import 'package:flutter/material.dart';
import 'package:flutter_store_nodjs/providers/user_provider.dart';
import 'package:provider/provider.dart';
import '../widgets/account_appbar.dart';
import '../widgets/orders.dart';
import '../widgets/top_buttons.dart';
import '../widgets/user_info.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context).user;
    return Container(
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
              ],
            ),
          )
        ],
      ),
    );
  }
}
