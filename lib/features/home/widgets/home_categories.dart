import 'package:flutter/material.dart';
import 'package:flutter_store_nodjs/features/home/screens/home_category_screen.dart';

import '../../../components/myconstans.dart';
import 'single_category.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({super.key});
  void navigateToCategotyScreen(BuildContext context, String category) {
    Navigator.pushNamed(context, HomeCategoryScreen.routeName,
        arguments: category);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      //color: MyConstans.textLight,
      decoration: const BoxDecoration(gradient: MyConstans.appBarGradient),
      child: ListView.builder(
          itemCount: MyConstans.categories.length,
          scrollDirection: Axis.horizontal,
          itemExtent: 120,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => navigateToCategotyScreen(
                context,
                MyConstans.categories[index]['title']!,
              ),
              child: Padding(
                padding: index == 0
                    ? const EdgeInsets.only(left: 10.0, top: 10, bottom: 10)
                    : const EdgeInsets.only(left: 0, top: 10, bottom: 10),
                child: SingleCategory(
                    image: MyConstans.categories[index]['image']!,
                    name: MyConstans.categories[index]['title']!),
              ),
            );
          }),
    );
  }
}
