import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_store_nodjs/common/widgets/custom_textfield.dart';
import 'package:flutter_store_nodjs/components/constans.dart';
import 'package:flutter_store_nodjs/features/admin/providers/products_provider.dart';
import 'package:provider/provider.dart';

import '../widgets/myadmin_appbar.dart';

class AddProductScreen extends StatefulWidget {
  static const String routeName = '/add-product-screen';
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductsProvider>(context);
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              productProvider.images.isEmpty
                  ? GestureDetector(
                      onTap: productProvider.selectImages,
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
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
                              color: MyConstans.text.withOpacity(.7),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Add Product Images',
                              style: TextStyle(
                                  fontSize: 24,
                                  color: MyConstans.text.withOpacity(.7)),
                            ),
                          ],
                        ),
                      ),
                    )
                  : CarouselSlider(
                      items: productProvider.images.map((i) {
                        return Builder(
                            builder: (BuildContext context) => Image.file(
                                  i,
                                  width: MediaQuery.of(context).size.width,
                                  height: 200,
                                  fit: BoxFit.cover,
                                ));
                      }).toList(),
                      options:
                          CarouselOptions(viewportFraction: 1, height: 200)),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: CustomTextField(
                  controller: productProvider.productTitleController,
                  hintText: 'Product Name',
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: CustomTextField(
                  controller: productProvider.productDescriptionController,
                  hintText: 'Product descreption',
                  maxLines: 7,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: CustomTextField(
                  controller: productProvider.productPriceController,
                  hintText: 'Product price',
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: CustomTextField(
                  controller: productProvider.productQuantityController,
                  hintText: 'Product quantity',
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    const Text(
                      'Product category:  ',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.normal),
                    ),
                    DropdownButton(
                      items: productProvider.categoriesNames.map((String item) {
                        return DropdownMenuItem(
                          value: item,
                          child: Text(item),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          productProvider.defaultCategory = newValue!;
                        });
                      },
                      value: productProvider.defaultCategory,
                      icon: const Icon(Icons.arrow_drop_down),
                    )
                  ],
                ),
              )
            ],
          ),
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
