import 'dart:convert';

CustomerModel customerModelFromJson(String str) =>
    CustomerModel.fromJson(json.decode(str));

String customerModelToJson(CustomerModel data) => json.encode(data.toJson());

class CustomerModel {
  CustomerModel({
    this.id = '',
    this.email = '',
    this.name = '',
    this.phone = '',
    this.image =
        'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fHww',
  });

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

  Map<String, dynamic> toJson() => {
    "_id": id,
    "email": email,
    "name": name,
    "image": image,
    "phone": phone,
  };
}
