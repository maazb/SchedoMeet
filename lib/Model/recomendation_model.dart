// To parse this JSON data, do
//
//     final recomendationModel = recomendationModelFromJson(jsonString);

import 'dart:convert';

List<List<DateTime>> recomendationModelFromJson(List lst) =>
    List<List<DateTime>>.from(lst.map(
        (x) => List<DateTime>.from(x.map((x) => DateTime.parse(x))))).toList();

String recomendationModelToJson(List<List<DateTime>> data) =>
    json.encode(List<dynamic>.from(data
        .map((x) => List<dynamic>.from(x.map((x) => x.toIso8601String())))));
