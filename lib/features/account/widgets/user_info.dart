import 'package:flutter/material.dart';
import 'package:flutter_store_nodjs/models/user.dart';

import '../../../components/myconstans.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({
    super.key,
    required this.userProvider,
  });

  final User userProvider;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RichText(
          text: TextSpan(
              text: "Hello, ",
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.normal,
                color: MyConstans.text,
              ),
              children: [
                TextSpan(
                    text: userProvider.name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: MyConstans.text,
                    ))
              ]),
        ),
        const CircleAvatar(
          backgroundImage: AssetImage(
            MyConstans.avatar,
          ),
          //child: Image.asset(GlobalVars.avatar, height: 90, width: 90),
          radius: 25,
        )
      ],
    );
  }
}
