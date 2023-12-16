import 'package:flutter/material.dart';

import '../../../components/myconstans.dart';
import '../../search/screens/search_screen.dart';

class MySearchAppBar extends StatefulWidget {
  const MySearchAppBar({
    super.key,
  });

  @override
  State<MySearchAppBar> createState() => _MySearchAppBarState();
}

class _MySearchAppBarState extends State<MySearchAppBar> {
  TextEditingController searchQueryController = TextEditingController();
  void goToSearchScreen(String searchQuery) {
    Navigator.pushNamed(
      context,
      SearchScreen.routeName,
      arguments: searchQuery,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 95,
      padding: const EdgeInsets.only(top: 30, left: 15, right: 15, bottom: 10),
      color: MyConstans.redColorMain,
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
            controller: searchQueryController,
            onFieldSubmitted: goToSearchScreen,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.search_outlined, size: 30),
              hintText: 'Search Amazon',
              hintStyle: TextStyle(fontSize: 18),
              border: InputBorder.none,
              suffixIcon: SizedBox(
                //color: Colors.amber,
                width: 70,
                child: Row(
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
