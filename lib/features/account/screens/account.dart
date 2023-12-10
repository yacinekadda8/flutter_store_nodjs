import 'package:flutter/material.dart';
import 'package:flutter_store_nodjs/components/constans.dart';
import 'package:flutter_store_nodjs/models/user.dart';
import 'package:flutter_store_nodjs/providers/user_provider.dart';
import 'package:provider/provider.dart';

import '../widgets/account_btn.dart';
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
          const MyAppBar(),
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

class MyAppBar extends StatelessWidget {
  const MyAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
      color: MyConstans.secondaryAccent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(MyConstans.logo, height: 30, width: 90),
          //const Expanded(child: SizedBox()),
          const SizedBox(
            child: Row(
              children: [
                Icon(Icons.notifications_outlined, size: 40),
                Icon(Icons.search_outlined, size: 40),
              ],
            ),
          )
        ],
      ),
    );
  }
}
