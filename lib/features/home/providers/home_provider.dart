import 'package:flutter/material.dart';

import '../../../models/product_model.dart';
import '../services/home_services.dart';

class HomeProvider extends ChangeNotifier {
  HomeServices homeServices = HomeServices();
  List<ProductModel>? productsList;
  void getProductsInvok(context, productId) async {
    List<ProductModel>? fetchedProducts =
        await homeServices.getSimilarProducts(context, productId);
    productsList = fetchedProducts;
    notifyListeners();
  }
}
