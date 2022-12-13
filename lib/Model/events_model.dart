// To parse this JSON data, do
//
//     final eventsModel = eventsModelFromJson(jsonString);

import 'dart:convert';

List<EventsModel> eventsModelFromJson(List lst) =>
    List<EventsModel>.from(lst.map((x) => EventsModel.fromJson(x)));

String eventsModelToJson(List<EventsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EventsModel {
  EventsModel({
    this.title,
    this.detail,
    this.eventType,
    this.date,
    this.startTime,
    this.endTime,
    this.createdBy,
    this.attendees,
    this.id,
  });

  String? title;
  String? detail;
  String? eventType;
  DateTime? date;
  DateTime? startTime;
  DateTime? endTime;
  int? createdBy;
  List<int>? attendees;
  int? id;

  factory EventsModel.fromJson(Map<String, dynamic> json) => EventsModel(
        title: json["title"],
        detail: json["detail"],
        eventType: json["event_type"],
        date: DateTime.parse(json["date"]),
        startTime: DateTime.parse(json["start_time"]),
        endTime: DateTime.parse(json["end_time"]),
        createdBy: json["createdBy"],
        attendees: List<int>.from(json["attendees"].map((x) => x)),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "detail": detail,
        "event_type": eventType,
        "date":
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "start_time": startTime!.toIso8601String(),
        "end_time": endTime!.toIso8601String(),
        "createdBy": createdBy,
        "attendees": List<dynamic>.from(attendees!.map((x) => x)),
        "id": id,
      };
}
