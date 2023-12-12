import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_store_nodjs/components/utils.dart';

class ProductsProvider extends ChangeNotifier {
  TextEditingController productTitleController = TextEditingController();
  TextEditingController productDescriptionController = TextEditingController();
  TextEditingController productPriceController = TextEditingController();
  TextEditingController productQuantityController = TextEditingController();

  List<File> images = [];
  List<String> categoriesNames = [
    'Mobiles',
    'Laptop',
    'Computers',
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
    images = res;
    notifyListeners();
  }

  @override
  void dispose() {
    productTitleController.dispose();
    productDescriptionController.dispose();
    productPriceController.dispose();
    productQuantityController.dispose();
    super.dispose();
  }
}
