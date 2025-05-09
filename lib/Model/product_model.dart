// import 'dart:convert';

// ProductModel productModelFromJson(String str) =>
//     ProductModel.fromJson(json.decode(str));

// String productModelToJson(ProductModel data) => json.encode(data.toJson());

// class ProductModel {
//   ProductModel({
//     required this.count,
//     required this.products,
//   });

//   int count;
//   List<Product> products;

//   factory ProductModel.fromJson(Map<String, dynamic> json) {
//     List<Product> products = [];
//     if (json["products"] != null) {
//       products =
//           List<Product>.from(json["products"].map((x) => Product.fromJson(x)));
//     }
//     return ProductModel(
//       count: json["count"],
//       products: products,
//     );
//   }

//   Map<String, dynamic> toJson() => {
//         "count": count,
//         "products": List<dynamic>.from(products.map((x) => x.toJson())),
//       };
// }

// class Product {
//   String id;
//   String name;
//   double price;
//   double? compareAtPrice;
//   double? productCost;
//   String description;
//   String? category;
//   List<dynamic> images;
//   List<dynamic> colors;
//   String thumbnail;
//   String? model;
//   int? quantity;
//   String? promotion;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   double ratingsAverage;
//   bool? liked;

//   Product({
//     required this.id,
//     required this.name,
//     required this.price,
//     this.compareAtPrice,
//     this.productCost,
//     required this.description,
//     this.category,
//     required this.images,
//     required this.thumbnail,
//     required this.colors,
//     this.model,
//     this.quantity,
//     this.promotion,
//     this.createdAt,
//     this.updatedAt,
//     required this.ratingsAverage,
//     this.liked,
//   });

//   factory Product.fromJson(Map<String, dynamic> json) => Product(
//         id: json["_id"],
//         name: json["name"],
//         price: json["price"].toDouble(),
//         compareAtPrice: json["compare_at_price"].toDouble(),
//         productCost: json["productCost"].toDouble(),
//         description: json["description"],
//         category: json["category"],
//         images: List<dynamic>.from(json["images"].map((x) => x)),
//         colors: List<dynamic>.from(json["colors"].map((x) => x)),
//         thumbnail: json["thumbnail"],
//         model: json["model"],
//         quantity: json["quantity"],
//         promotion: json["promotion"],
//         liked: json["liked"],
//         ratingsAverage: json["ratingsAverage"].toDouble(),
//         createdAt: DateTime.parse(json["createdAt"]),
//         updatedAt: DateTime.parse(json["updatedAt"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "_id": id,
//         "name": name,
//         "price": price,
//         "compare_at_price": compareAtPrice,
//         "productCost": productCost,
//         "description": description,
//         "category": category,
//         "images": List<dynamic>.from(images.map((x) => x)),
//         "colors": List<dynamic>.from(colors.map((x) => x)),
//         "thumbnail": thumbnail,
//         "model": model,
//         "quantity": quantity,
//         "promotion": promotion,
//         "liked": liked,
//         "ratingsAverage": ratingsAverage,
//         "createdAt": createdAt!.toIso8601String(),
//         "updatedAt": updatedAt!.toIso8601String(),
//       };
// }
import 'dart:convert';

// 
const String baseUrl = "http://10.0.2.2:4002";

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  ProductModel({required this.count, required this.products});

  int count;
  List<Product> products;

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    List<Product> products = [];
    if (json["products"] != null) {
      products = List<Product>.from(
        json["products"].map((x) => Product.fromJson(x)),
      );
    }
    return ProductModel(count: json["count"], products: products);
  }

  Map<String, dynamic> toJson() => {
    "count": count,
    "products": List<dynamic>.from(products.map((x) => x.toJson())),
  };
}

class Product {
  String id;
  String name;
  double price;
  double? compareAtPrice;
  double? productCost;
  String description;
  String? category;
  List<String> images;
  List<String> colors;
  String thumbnail;
  String? model;
  int? quantity;
  String? promotion;
  DateTime? createdAt;
  DateTime? updatedAt;
  double ratingsAverage;
  bool? liked;

  Product({
    required this.id,
    required this.name,
    required this.price,
    this.compareAtPrice,
    this.productCost,
    required this.description,
    this.category,
    required this.images,
    required this.thumbnail,
    required this.colors,
    this.model,
    this.quantity,
    this.promotion,
    this.createdAt,
    this.updatedAt,
    required this.ratingsAverage,
    this.liked,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["_id"],
    name: json["name"],
    price: json["price"].toDouble(),
    compareAtPrice: json["compare_at_price"]?.toDouble(),
    productCost: json["productCost"]?.toDouble(),
    description: json["description"],
    category: json["category"],
    images: List<String>.from(json["images"].map((x) => "$baseUrl$x")),
    colors: List<String>.from(json["colors"]),
    thumbnail: "$baseUrl${json["thumbnail"]}",
    model: json["model"],
    quantity: json["quantity"],
    promotion: json["promotion"],
    liked: json["liked"],
    ratingsAverage: json["ratingsAverage"].toDouble(),
    createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
    updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "price": price,
    "compare_at_price": compareAtPrice,
    "productCost": productCost,
    "description": description,
    "category": category,
    "images": images.map((x) => x.replaceFirst(baseUrl, "")).toList(),
    "colors": colors,
    "thumbnail": thumbnail.replaceFirst(baseUrl, ""),
    "model": model,
    "quantity": quantity,
    "promotion": promotion,
    "liked": liked,
    "ratingsAverage": ratingsAverage,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
  };
}
