import 'package:flutter/material.dart';
import 'package:flutter_store_nodjs/features/admin/screens/add_product_screen.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Products Screen'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(
                context,
                AddProductScreen.routeName,
               
              );
        },
        tooltip: 'Add a new product',
        child: const Icon(Icons.add_outlined),
      ),
    );
  }
}
