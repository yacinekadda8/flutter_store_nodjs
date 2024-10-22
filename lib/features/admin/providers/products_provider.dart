import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_store_nodjs/components/utils.dart';

import '../../../models/product_model.dart';
import '../services/admin_services.dart';

class ProductsProvider extends ChangeNotifier {
  TextEditingController productNameController = TextEditingController();
  TextEditingController productDescriptionController = TextEditingController();
  TextEditingController productPriceController = TextEditingController();
  TextEditingController productQuantityController = TextEditingController();
  TextEditingController productDiscountController = TextEditingController();
  List<File> images = [];
  final addProductGlobalkey = GlobalKey<FormState>();
  AdminServices adminServices = AdminServices();
  List<String> categoriesNames = [
    'Mobiles',
    'Computers',
    'Laptops',
    'Accessories',
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

  void addProduct(
      {required BuildContext context, required VoidCallback onSuccess}) {
    if (addProductGlobalkey.currentState!.validate() == true|| images.isNotEmpty) {
      adminServices.addProduct(
          context: context,
          name: productNameController.text,
          description: productDescriptionController.text,
          category: defaultCategory,
          quantity: int.parse(productQuantityController.text),
          discount: int.parse(productDiscountController.text),
          price: int.parse(productPriceController.text),
          images: images,
          onSuccess: () {
            showSnackBar(context, 'Product Added successfuly!');
            productNameController.clear();
            productDescriptionController.clear();
            productPriceController.clear();
            productQuantityController.clear();
            productDiscountController.clear();
            images.clear();
            notifyListeners();
            Navigator.pop(context);
          });
    }
  }

  void deleteProduct(ProductModel product, int index, BuildContext context,
      VoidCallback onSuccess) {
    adminServices.deleteProduct(
      context: context,
      product: product,
      onSuccess: onSuccess,
    );
  }

  @override
  void dispose() {
    productNameController.dispose();
    productDescriptionController.dispose();
    productPriceController.dispose();
    productDiscountController.dispose();
    productQuantityController.dispose();
    super.dispose();
  }
}
