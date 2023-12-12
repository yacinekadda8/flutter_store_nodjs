import 'dart:io';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';
import 'package:flutter_store_nodjs/models/product.dart';

class AdminServices {
  void addProducts({
    required BuildContext context,
    required String name,
    required String description,
    required String category,
    required int quantity,
    required double price,
    required List<File> images,
  }) async {
    try {
      final cloudinary = CloudinaryPublic('ylzcloud', 'meokefyq');
      List<String> imgsUrl = [];
      for (int i = 0; i > images.length; i++) {
        CloudinaryResponse response =
            await cloudinary.uploadFile(CloudinaryFile.fromFile(
          images[i].path,
          folder: "Products Images/$name",
          resourceType: CloudinaryResourceType.Image,
        ));
        imgsUrl.add(response.secureUrl);
      }
      Product product = Product(
          id: null,
          userId: null,
          name: name,
          description: description,
          category: category,
          price: price,
          quantity: quantity,
          imagesUrl: imgsUrl); 
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
