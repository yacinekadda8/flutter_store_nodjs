// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Product {
  final String? id;
  final String? userId;
  final String name;
  final String description;
  final String category;
  final double price;
  final int quantity;
  final List<String> imagesUrl;

  Product(
      {required this.id,
      required this.userId,
      required this.name,
      required this.description,
      required this.category,
      required this.price,
      required this.quantity,
      required this.imagesUrl});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'userId': userId,
      'name': name,
      'description': description,
      'categoty': category,
      'price': price,
      'quantity': quantity,
      'imagesUrl': imagesUrl,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
        id: map['_id'] != null ? map['_id'] as String : null,
        userId: map['userId'] != null ? map['userId'] as String : null,
        name: map['name'] as String,
        description: map['description'] as String,
        category: map['categoty'] as String,
        price: map['price'] as double,
        quantity: map['quantity'] as int,
        imagesUrl: List<String>.from(
          (map['imagesUrl'] as List<String>),
        ));
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);
}