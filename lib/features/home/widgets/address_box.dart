import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../components/myconstans.dart';

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
          Icon(
            Icons.location_on_outlined,
            color: MyConstans.yellowPrimary,
          ),
          Gap(10),
          Expanded(
              child: Text('Deliver to Algeria',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16,
                    color: MyConstans.text,
                    fontWeight: FontWeight.w900,
                  ))),
          const Icon(
            Icons.keyboard_arrow_down_outlined,
            color: MyConstans.yellowPrimary,
          ),
        ],
      ),
    );
  }
}
