class ProductModel {
  String? id;
  String? name;
  String? description;
  String? category;
  int? price;
  int? quantity;
  List<String>? images;

  ProductModel({
    this.id,
    this.name,
    this.description,
    this.category,
    this.price,
    this.quantity,
    this.images,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json["_id"];
    name = json["name"];
    description = json["description"];
    category = json["category"];
    price = json["price"];
    quantity = json["quantity"];
    images = json["images"] == null ? null : List<String>.from(json["images"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["name"] = name;
    data["description"] = description;
    data["category"] = category;
    data["price"] = price;
    data["quantity"] = quantity;
    if (images != null) {
      data["images"] = images;
    }
    return data;
  }
}