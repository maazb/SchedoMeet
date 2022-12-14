// To parse this JSON data, do
//
//     final userNameModel = userNameModelFromJson(jsonString);

import 'dart:convert';

List<UserNameModel> userNameModelFromJson(List lst) =>
    List<UserNameModel>.from(lst.map((x) => UserNameModel.fromJson(x)));

String userNameModelToJson(List<UserNameModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserNameModel {
  UserNameModel({
    this.id,
    this.name,
    this.email,
    this.image,
  });

  int? id;
  String? name;
  String? email;
  String? image;

  factory UserNameModel.fromJson(Map<String, dynamic> json) => UserNameModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "image": image,
      };
}
