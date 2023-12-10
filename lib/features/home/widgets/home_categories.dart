
import 'package:flutter/material.dart';

import '../../../components/constans.dart';
import 'single_category.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      //color: MyConstans.textLight,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
        colors: [
          Color.fromARGB(255, 241, 44, 87),
          Color.fromARGB(255, 206, 103, 44),
        ],
        stops: [0.5, 1.0],
      )),
      child: ListView.builder(
          itemCount: MyConstans.categories.length,
          scrollDirection: Axis.horizontal,
          itemExtent: 120,
          itemBuilder: (context, index) {
            return Padding(
              padding: index == 0
                  ? const EdgeInsets.only(
                      left: 10.0, top: 10, bottom: 10)
                  : const EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: SingleCategory(
                  image: MyConstans.categories[index]['image']!,
                  name: MyConstans.categories[index]['title']!),
            );
          }),
    );
  }
}