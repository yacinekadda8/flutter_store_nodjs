import 'dart:convert';
import 'dart:io';

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';
import 'package:flutter_store_nodjs/components/constans.dart';
import 'package:flutter_store_nodjs/models/product.dart';
import 'package:flutter_store_nodjs/providers/user_provider.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../../../components/error_handling.dart';
import '../../../components/utils.dart';

class AdminServices {
//   Future<List<Product>> getAllProduct() async {
//   try {
//     http.Response response = await http.get(
//       Uri.parse('$uri/admin/get-products'),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8'
//       },
//     );

//     if (response.statusCode == 200) {
//       List<dynamic> productsJson = json.decode(response.body);
//       List<Product> productsList = productsJson
//           .map((model) => Product.fromJson(model))
//           .toList();
//       return productsList;
//     } else {
//       throw Exception('Failed to load products');
//     }
//   } catch (e) {
//     throw Exception('Failed to load products: ${e.toString()}');
//   }
// }

  Future<List<Product>> getAllProduct(
    BuildContext context,
  ) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Product> products = [];
    try {
      http.Response response = await http.get(
        Uri.parse('$uri/admin/get-products'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'app-auth-token': userProvider.user.token,
        },
      );

      if (context.mounted) {
        httpErrorHandle(
          response: response,
          context: context,
          onSuccess: () {
            for (int i = 0; i < jsonDecode(response.body).length; i++) {
              products.add(Product.fromJson(
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

  void addProduct({
    required BuildContext context,
    required String name,
    required String description,
    required String category,
    required String quantity,
    required String price,
    required List<File> images,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false).user;
    try {
      final cloudinary = CloudinaryPublic('ylzcloud', 'sorwhhco');
      List<String> imgsUrl = [];
      for (int i = 0; i < images.length; i++) {
        CloudinaryResponse response =
            await cloudinary.uploadFile(CloudinaryFile.fromFile(
          images[i].path,
          folder: name,
        ));
        imgsUrl.add(response.secureUrl);
      }
      Product product = Product(
          name: name,
          description: description,
          category: category,
          price: double.parse(price),
          quantity: int.parse(quantity),
          images: imgsUrl);

      http.Response res = await http.post(
        Uri.parse("$uri/admin/add-product"),
        body: product.toJson(),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          "app-auth-token": userProvider.token.toString()
        },
      );
      if (context.mounted) {
        httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            showSnackBar(context, 'Product Added successfuly!');
            Navigator.pop(context);
          },
        );
      }
    } catch (e) {
      //debugPrint(e.toString());
      if (context.mounted) showSnackBar(context, e.toString());
    }
  }
}
