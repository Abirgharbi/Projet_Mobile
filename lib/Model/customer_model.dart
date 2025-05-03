import 'dart:convert';

CustomerModel customerModelFromJson(String str) =>
    CustomerModel.fromJson(json.decode(str));

String customerModelToJson(CustomerModel data) => json.encode(data.toJson());

class CustomerModel {
  CustomerModel(
      {this.id = '',
      this.email = '',
      this.name = '',
      this.phone = '',
      this.image =
          "https://res.cloudinary.com/dbkivxzek/image/upload/v1681248811/ARkea/s8mz71cwjnuxpq5tylyn.png"});

  String? id;
  String? email;
  String? name;
  String? image;
  String? phone;

  factory CustomerModel.fromJson(Map<String, dynamic> json) => CustomerModel(
        id: json["_id"],
        email: json["email"],
        name: json["name"],
        image: json["image"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() =>
      {"_id": id, "email": email, "name": name, "image": image, "phone": phone};
}
