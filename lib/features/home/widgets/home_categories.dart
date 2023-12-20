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
    double myHeight = MediaQuery.of(context).size.height;
    return Container(
      height: myHeight / 3,
      //color: MyConstans.textLight,
      decoration: BoxDecoration(
        gradient: MyConstans.appBarGradient,
      ),
      child: Column(
        children: [
          const Expanded(
            child: SizedBox(
              height: 0,
            ),
          ),
          SizedBox(
            height: myHeight / 7.3,
            child: ListView.builder(
                itemCount: MyConstans.categories.length,
                scrollDirection: Axis.horizontal,
                itemExtent: myHeight / 7.3,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => navigateToCategotyScreen(
                      context,
                      MyConstans.categories[index]['title']!,
                    ),
                    child: Padding(
                      padding: index == 0
                          ? const EdgeInsets.only(
                              left: 10.0, top: 10, bottom: 10)
                          : const EdgeInsets.only(left: 0, top: 10, bottom: 10),
                      child: SingleCategory(
                          image: MyConstans.categories[index]['image']!,
                          name: MyConstans.categories[index]['title']!),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
