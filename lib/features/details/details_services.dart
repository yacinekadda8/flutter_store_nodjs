import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http ;
import '../../components/error_handling.dart';
import '../../components/myconstans.dart';
import '../../models/product_model.dart';

class DetailsServices {
    Future<List<ProductModel>> getSimilarProducts(
      BuildContext context, String productId) async {
    // final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<ProductModel> products = [];
    try {
      http.Response response = await http.get(
        Uri.parse('$uri/home/similar-products/$productId'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          //'app-auth-token': userProvider.user.token,
        },
      );

      if (context.mounted) {
        httpErrorHandle(
          response: response,
          context: context,
          onSuccess: () {
            for (int i = 0; i < jsonDecode(response.body).length; i++) {
              products.add(ProductModel.fromJson(
                jsonDecode(response.body)[i],
              ));
            }
          },
        );
      }

      // return products;
    } catch (e) {
      throw Exception('Failed to load products: ${e.toString()}');
    }
    return products;
  }
}