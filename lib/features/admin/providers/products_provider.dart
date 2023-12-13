import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_store_nodjs/components/utils.dart';
import 'package:image_picker/image_picker.dart';

import '../services/admin_services.dart';

class ProductsProvider extends ChangeNotifier {
  TextEditingController productNameController = TextEditingController();
  TextEditingController productDescriptionController = TextEditingController();
  TextEditingController productPriceController = TextEditingController();
  TextEditingController productQuantityController = TextEditingController();
  List<File> images = [];
  final addProductGlobalkey = GlobalKey<FormState>();
  AdminServices adminServices = AdminServices();
  List<String> categoriesNames = [
    'Mobiles',
    'Computers',
    'Laptop',
    'Pc and Laptop accessories',
    'Tablets',
    'Watches'
  ];
  String defaultCategory = 'Mobiles';

  onCategoryChanged(String? newValue) {
    defaultCategory = newValue!;
    notifyListeners();
  }

  void selectImages() async {
    var res = await pickImages();
    images = res.map((xfile) => File(xfile.path)).toList();
    notifyListeners();
  }

  void addProduct({required context}) {
    if (addProductGlobalkey.currentState!.validate() || images.isNotEmpty) {
      adminServices.addProduct(
        context: context,
        name: productNameController.text,
        description: productNameController.text,
        category: defaultCategory,
        quantity: int.parse(productPriceController.text),
        price: double.parse(productQuantityController.text),
        images: images,
      );
    }
  }

  @override
  void dispose() {
    productNameController.dispose();
    productDescriptionController.dispose();
    productPriceController.dispose();
    productQuantityController.dispose();
    super.dispose();
  }
}
