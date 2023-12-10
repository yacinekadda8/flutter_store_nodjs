import 'package:flutter/material.dart';
import 'package:flutter_store_nodjs/components/constans.dart';
import 'package:flutter_store_nodjs/features/account/providers/account_provider.dart';
import 'package:provider/provider.dart';

import 'product.dart';

class Orders extends StatelessWidget {
  const Orders({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final accountProvider = Provider.of<AccountProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Your Orders',
              style: TextStyle(
                color: MyConstans.text,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Text(
              'See all',
              style: TextStyle(
                color: MyConstans.primaryAccent,
                fontSize: 18,
              ),
            )
          ],
        ),
        const Text(
          "Hmm, We couldn't find any orders",
          style: TextStyle(color: MyConstans.textLight, fontSize: 18.0),
        ),
        Container(
          height: 170,
          padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: accountProvider.orders.length,
              itemBuilder: ((context, index) {
                return Product(accountProvider: accountProvider, index: index);
              })),
        )
      ],
    );
  }
}
