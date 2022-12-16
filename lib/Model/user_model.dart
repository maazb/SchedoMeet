// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(dynamic parsedList) =>
    UserModel.fromJson(parsedList);

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.name,
    this.email,
    this.contact,
    this.image,
    this.fcmId,
    this.meetingCal,
    this.eventCal,
    this.newMeetingsOnHome,
    this.newMessagesOnHome,
    this.newMessageNotifications,
    this.newMeetingNotifications,
    this.requested,
    this.added,
    this.id,
    this.isActive,
  });

  String? name;
  String? email;
  String? contact;
  String? image;
  String? fcmId;
  String? meetingCal;
  String? eventCal;
  bool? newMeetingsOnHome;
  bool? newMessagesOnHome;
  bool? newMessageNotifications;
  bool? newMeetingNotifications;
  List<int>? requested;
  List<int>? added;
  int? id;
  bool? isActive;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: json["name"],
        email: json["email"],
        contact: json["contact"],
        image: json["image"],
        fcmId: json["fcmId"],
        meetingCal: json["meetingCal"],
        eventCal: json["eventCal"],
        newMeetingsOnHome: json["newMeetingsOnHome"],
        newMessagesOnHome: json["newMessagesOnHome"],
        newMessageNotifications: json["newMessageNotifications"],
        newMeetingNotifications: json["newMeetingNotifications"],
        requested: List<int>.from(json["requested"].map((x) => x)),
        added: List<int>.from(json["added"].map((x) => x)),
        id: json["id"],
        isActive: json["is_active"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "contact": contact,
        "image": image,
        "fcmId": fcmId,
        "meetingCal": meetingCal,
        "eventCal": eventCal,
        "newMeetingsOnHome": newMeetingsOnHome,
        "newMessagesOnHome": newMessagesOnHome,
        "newMessageNotifications": newMessageNotifications,
        "newMeetingNotifications": newMeetingNotifications,
        "requested": List<dynamic>.from(requested!.map((x) => x)),
        "added": List<dynamic>.from(added!.map((x) => x)),
        "id": id,
        "is_active": isActive,
      };
}
