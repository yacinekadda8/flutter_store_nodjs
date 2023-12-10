import 'package:flutter/material.dart';
import 'package:flutter_store_nodjs/features/account/widgets/account_btn.dart';

class TopButtons extends StatelessWidget {
  const TopButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            AccountBtn(
              onPressed: () {},
              text: 'Your Orders',
            ),
            const SizedBox(width: 10),
            AccountBtn(
              onPressed: () {},
              text: 'Buy Again',
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            AccountBtn(
              onPressed: () {},
              text: 'Your Account',
            ),
            const SizedBox(width: 10),
            AccountBtn(
              onPressed: () {},
              text: 'Buy Lists',
            ),
          ],
        ),
      ],
    );
  }
}
