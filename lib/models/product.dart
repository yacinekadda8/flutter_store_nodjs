import 'dart:convert';

class Product {
  final String? id;
  final String name;
  final String description;
  final String category;
  final double price;
  final int quantity;
  final List<String> images;

  Product(
      {this.id,
      required this.name,
      required this.description,
      required this.category,
      required this.price,
      required this.quantity,
      required this.images});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'category': category,
      'price': price,
      'quantity': quantity,
      'images': images,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
        id: map['_id'] != null ? map['_id'] as String : null,
        name: map['name'] as String,
        description: map['description'] as String,
        category: map['categoty'] as String,
        price: map['price'] as double,
        quantity: map['quantity'] as int,
        images: List<String>.from(
          (map['images'] as List<String>),
        ));
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);
}
