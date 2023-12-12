import 'package:flutter/material.dart';

import '../../../components/constans.dart';
import '../providers/account_provider.dart';

class SingleProduct extends StatelessWidget {
  const SingleProduct({
    super.key,
    required this.accountProvider,
    required this.index,
  });

  final AccountProvider accountProvider;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(color: MyConstans.border, width: 1.0),
          borderRadius: BorderRadius.circular(3),
        ),
        child: Container(
          width: 180,
          height: 180,
          padding: const EdgeInsets.all(10),
          child: Image.network(
            accountProvider.orders[index],
            fit: BoxFit.fitHeight,
          ),
        ),
      ),
    );
  }
}
