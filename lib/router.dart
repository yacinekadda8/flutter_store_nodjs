import 'package:flutter/material.dart';
import 'package:flutter_store_nodjs/features/home/screens/home_category_screen.dart';
import 'package:flutter_store_nodjs/features/search/screens/search_screen.dart';
import 'package:flutter_store_nodjs/models/product_model.dart';
import 'features/home/screens/product_details_screen.dart';
import 'home.dart';
import 'features/admin/screens/add_product_screen.dart';
import 'features/auth/screens/auth_screen.dart';
import 'features/home/screens/home_screen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AuthScreen(),
      );

    case HomeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const HomeScreen(),
      );
    case Home.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Home(),
      );
    case AddProductScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AddProductScreen(),
      );
    case ProductDetailsScreen.routeName:
      var product = routeSettings.arguments as ProductModel;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => ProductDetailsScreen(product: product),
      );
    case SearchScreen.routeName:
      var searchQuery = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => SearchScreen(searchQuery: searchQuery),
      );

    case HomeCategoryScreen.routeName:
      // get you value from the arguments
      var categotie = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => HomeCategoryScreen(
          // get you value from the variable
          category: categotie,
        ),
      );

    // case CategoryDealsScreen.routeName:
    //   var category = routeSettings.arguments as String;
    //   return MaterialPageRoute(
    //     settings: routeSettings,
    //     builder: (_) => CategoryDealsScreen(
    //       category: category,
    //     ),
    //   );
    // case SearchScreen.routeName:
    //   var searchQuery = routeSettings.arguments as String;
    //   return MaterialPageRoute(
    //     settings: routeSettings,
    //     builder: (_) => SearchScreen(
    //       searchQuery: searchQuery,
    //     ),
    //   );
    // case ProductDetailScreen.routeName:
    //   var product = routeSettings.arguments as Product;
    //   return MaterialPageRoute(
    //     settings: routeSettings,
    //     builder: (_) => ProductDetailScreen(
    //       product: product,
    //     ),
    //   );
    // case AddressScreen.routeName:
    //   var totalAmount = routeSettings.arguments as String;
    //   return MaterialPageRoute(
    //     settings: routeSettings,
    //     builder: (_) => AddressScreen(
    //       totalAmount: totalAmount,
    //     ),
    //   );
    // case OrderDetailScreen.routeName:
    //   var order = routeSettings.arguments as Order;
    //   return MaterialPageRoute(
    //     settings: routeSettings,
    //     builder: (_) => OrderDetailScreen(
    //       order: order,
    //     ),
    //   );
    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('Screen does not exist!'),
          ),
        ),
      );
  }
}
