import 'package:flutter/material.dart';
import 'package:flutter_store_nodjs/common/widgets/custom_textfield.dart';
import 'package:flutter_store_nodjs/components/constans.dart';

import '../widgets/myadmin_appbar.dart';

class AddProductScreen extends StatelessWidget {
  static const String routeName = '/add-product-screen';
  const AddProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: MyConstans.brandColor,
        title: Text(
          "Add a new Product",
          style: TextStyle(color: MyConstans.text, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              height: 200,
              decoration: BoxDecoration(
                  color: MyConstans.surface,
                  border: Border.all(
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(5)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add_a_photo_outlined,
                    size: 40,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Add Product Images',
                    style: TextStyle(fontSize: 24),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CustomTextField(
                controller: TextEditingController(),
                hintText: 'Product title',
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CustomTextField(
                controller: TextEditingController(),
                hintText: 'Product descreption',
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CustomTextField(
                controller: TextEditingController(),
                hintText: 'Product price',
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CustomTextField(
                controller: TextEditingController(),
                hintText: 'Product quantity',
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Add a new product',
        child: const Icon(Icons.save_outlined),
      ),
    );
  }
}
