
import 'package:flutter/material.dart';

import '../../../components/constans.dart';

class MyHomeAppBar extends StatelessWidget {
  const MyHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 95,
      padding: const EdgeInsets.only(top: 30, left: 15, right: 15, bottom: 10),
      color: MyConstans.secondaryAccent,
      child: Container(
        padding: const EdgeInsets.only(top: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 1, color: MyConstans.border),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: TextFormField(
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search_outlined, size: 30),
              hintText: 'Search Amazon',
              hintStyle: const TextStyle(fontSize: 18),
              border: InputBorder.none,
              suffixIcon: Container(
                //color: Colors.amber,
                width: 70,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(Icons.image_search_outlined, size: 30),
                    Icon(Icons.mic_outlined, size: 30),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
