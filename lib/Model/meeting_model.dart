// To parse this JSON data, do
//
//     final meetingModel = meetingModelFromJson(jsonString);

import 'dart:convert';

List<MeetingModel> meetingModelFromJson(List lst) =>
    List<MeetingModel>.from(lst.map((x) => MeetingModel.fromJson(x)));

String meetingModelToJson(List<MeetingModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MeetingModel {
  MeetingModel({
    this.title,
    this.detail,
    this.meetingType,
    this.startDate,
    this.endDate,
    this.startTime,
    this.endTime,
    this.createdBy,
    this.attendees,
    this.seen,
    this.id,
  });

  String? title;
  String? detail;
  String? meetingType;
  DateTime? startDate;
  DateTime? endDate;
  DateTime? startTime;
  DateTime? endTime;
  int? createdBy;
  List<int>? attendees;
  bool? seen;
  int? id;

  factory MeetingModel.fromJson(Map<String, dynamic> json) => MeetingModel(
        title: json["title"],
        detail: json["detail"],
        meetingType: json["meeting_type"],
        startDate: DateTime.parse(json["start_date"]),
        endDate: DateTime.parse(json["end_date"]),
        startTime: DateTime.parse(json["start_time"]),
        endTime: DateTime.parse(json["end_time"]),
        createdBy: json["createdBy"],
        attendees: List<int>.from(json["attendees"].map((x) => x)),
        seen: json["seen"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "detail": detail,
        "meeting_type": meetingType,
        "start_date":
            "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
        "end_date":
            "${endDate!.year.toString().padLeft(4, '0')}-${endDate!.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}",
        "start_time": startTime!.toIso8601String(),
        "end_time": endTime!.toIso8601String(),
        "createdBy": createdBy,
        "attendees": List<dynamic>.from(attendees!.map((x) => x)),
        "seen": seen,
        "id": id,
      };
}
