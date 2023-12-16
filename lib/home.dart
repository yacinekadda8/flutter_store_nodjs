import 'package:flutter/material.dart';
import 'package:flutter_store_nodjs/components/myconstans.dart';
import 'features/account/screens/account_screen.dart';
import 'features/home/screens/home_screen.dart';

// Define the BottomBar widget as a StatefulWidget
class Home extends StatefulWidget {
  // Define a route name for the widget
  static const String routeName = "/actual-home";

  // Constructor for the BottomBar widget
  const Home({super.key});

  // Override the createState method to return the associated state class
  @override
  State<Home> createState() => _HomeState();
}

// Define the associated state class for BottomBar
class _HomeState extends State<Home> {
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
    const HomeScreen(),
    const AccountScreen(),
    const Center(child: Text("cart")),
  ];

  // Build method to construct the widget's UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Main body of the widget, contains List<Widget> pages
      body: pages[_page],
      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page, // Currently selected page index
        selectedItemColor: MyConstans.lightBlueSecondary, // Selected item color
        unselectedItemColor: MyConstans.redColorMain, // Unselected item color
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
            icon: Icons.person_outlined,
            pageNumber: 1,
          ),
          BottomNavigationBarItem(
            label: '',
            // Custom container for the shopping cart item with a badge
            icon: Container(
              width: btmBarItemWidth,
              // Styling for the container border
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(
                          color: _page == 2
                              ? MyConstans.lightBlueSecondary
                              : MyConstans.background,
                          width: borderWidth))),
              // Badge widget with a label and shopping cart icon
              child: const Badge(
                label: Text('7'),
                child: Icon(Icons.shopping_cart_outlined),
              ),
            ),
          )
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
                        ? MyConstans.lightBlueSecondary
                        : MyConstans.background,
                    width: borderWidth))),
        child: Icon(icon), // Icon representing the item
      ),
    );
  }
}
