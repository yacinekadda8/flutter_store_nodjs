
import 'package:flutter/material.dart';

import '../../../components/constans.dart';

class AddressBox extends StatelessWidget {
  const AddressBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 15),
      height: 50,
      decoration: const BoxDecoration(gradient: MyConstans.appBarGradient),
      child: const Row(
        children: [
          Icon(Icons.location_on_outlined),
          Expanded(
              child: Text('Deliver to Algeria',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 15))),
          Icon(Icons.keyboard_arrow_down_outlined),
        ],
      ),
    );
  }
}
