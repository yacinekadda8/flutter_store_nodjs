
// class Product {
//   final String? id;
//   final String name;
//   final String description;
//   final String category;
//   final double price;
//   final int quantity;
//   final List<String> images;

//   Product({
//     this.id,
//     required this.name,
//     required this.description,
//     required this.category,
//     required this.price,
//     required this.quantity,
//     required this.images,
//   });

//   factory Product.fromRawJson(String str) => Product.fromJson(json.decode(str));

//   String toRawJson() => json.encode(toJson());

//   factory Product.fromJson(Map<String, dynamic> json) => Product(
//         id: json["_id"],
//         name: json["name"],
//         description: json["description"],
//         category: json["category"],
//         price: json["price"]?.toDouble(),
//         quantity: json["quantity"],
//         images: List<String>.from(json["images"].map((x) => x)),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "description": description,
//         "category": category,
//         "price": price,
//         "quantity": quantity,
//         "images": List<dynamic>.from(images.map((x) => x)),
//       };

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'id': id,
//       'name': name,
//       'description': description,
//       'category': category,
//       'price': price,
//       'quantity': quantity,
//       'images': images,
//     };
//   }

//   factory Product.fromMap(Map<String, dynamic> map) {
//     return Product(
//         id: map['_id'] != null ? map['_id'] as String : null,
//         name: map['name'] as String,
//         description: map['description'] as String,
//         category: map['categoty'] as String,
//         price: map['price'] as double,
//         quantity: map['quantity'] as int,
//         images: List<String>.from(
//           (map['images'] as List<String>),
//         ));
//   }
// }

class Product {
//   final String? id;
//   final String name;
//   final String description;
//   final String category;
//   final double price;
//   final int quantity;
//   final List<String> images;

//   Product(
//       {this.id,
//       required this.name,
//       required this.description,
//       required this.category,
//       required this.price,
//       required this.quantity,
//       required this.images});

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'id': id,
//       'name': name,
//       'description': description,
//       'category': category,
//       'price': price,
//       'quantity': quantity,
//       'images': images,
//     };
//   }

//   factory Product.fromMap(Map<String, dynamic> map) {
//     return Product(
//         id: map['_id'] != null ? map['_id'] as String : null,
//         name: map['name'] as String,
//         description: map['description'] as String,
//         category: map['categoty'] as String,
//         price: map['price'] as double,
//         quantity: map['quantity'] as int,
//         images: List<String>.from(
//           (map['images'] as List<String>),
//         ));
//   }

// //  String toJson() => json.encode(toMap());
//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "description": description,
//         "category": category,
//         "price": price,
//         "quantity": quantity,
//         "images": List<dynamic>.from(images.map((x) => x)),
//       };
//   factory Product.fromJson(String source) =>
//       Product.fromMap(json.decode(source) as Map<String, dynamic>);
}
