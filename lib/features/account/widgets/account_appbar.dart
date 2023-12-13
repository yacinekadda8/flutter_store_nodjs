import 'package:flutter/material.dart';
import '../../../components/constans.dart';

class AccountAppBar extends StatelessWidget {
  const AccountAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
      color: MyConstans.redColorMain,
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
