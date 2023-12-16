import 'package:flutter/material.dart';
import 'package:flutter_store_nodjs/features/admin/widgets/myadmin_appbar.dart';

import '../../../components/myconstans.dart';
import 'products_screen.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  // State variables
  int _page = 0; // Represents the currently selected page index
  double btmBarItemWidth = 40.0; // Width of bottom bar items
  double borderWidth = 4.0; // Border width for selected item

  // Method to update the selected page
  void updatePage(int page) {
    // Trigger a rebuild of the widget with the updated state
    setState(() {
      _page = page;
    });
  }

  // List of home screens
  List<Widget> pages = [
    // const HomeScreen(),
    // const Account(),
    const PostsScreen(),
    const Center(child: Text("analitics")),
    const Center(child: Text("cart")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: MyAdminAppbar(),
      ),
      body: pages[_page],
      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page, // Currently selected page index
        selectedItemColor: MyConstans.lightBlueSecondary, // Selected item color
        unselectedItemColor: MyConstans.yellowPrimary, // Unselected item color
        backgroundColor: MyConstans.background, // Background color
        iconSize: 28, // Size of icons in the bottom bar
        onTap: updatePage, // Callback function for item tap
        items: [
          // Define bottom navigation bar items using a helper function
          bottomNavBarItem(
            icon: Icons.home_outlined,
            pageNumber: 0,
          ),
          bottomNavBarItem(
            icon: Icons.analytics_outlined,
            pageNumber: 1,
          ),
          bottomNavBarItem(
            icon: Icons.library_add_check_outlined,
            pageNumber: 2,
          ),
        ],
      ),
    );
  }

  // Helper function to create a BottomNavigationBarItem
  BottomNavigationBarItem bottomNavBarItem({
    required IconData icon, // Required icon for the item
    required int pageNumber, // Required page number associated with the item
  }) {
    return BottomNavigationBarItem(
      label: '', // Empty label for a cleaner appearance
      // Custom container for the item with styling based on the selected state
      icon: Container(
        width: btmBarItemWidth,
        decoration: BoxDecoration(
            border: Border(
                top: BorderSide(
                    color: _page == pageNumber
                        ? MyConstans.lightBlueSecondary // selected
                        : MyConstans.background,
                    width: borderWidth))),
        child: Icon(icon), // Icon representing the item
      ),
    );
  }
}
