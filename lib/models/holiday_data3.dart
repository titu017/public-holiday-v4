// To parse this JSON data, do
//
//     final allHolidays3 = allHolidays3FromJson(jsonString);

import 'dart:convert';

AllHolidays3 allHolidays3FromJson(String str) =>
    AllHolidays3.fromJson(json.decode(str));

String allHolidays3ToJson(AllHolidays3 data) => json.encode(data.toJson());

class AllHolidays3 {
  List<Category> christian;
  List<Category> buddhist;
  List<Category> general;
  List<Category> hindu;
  List<Category> muslim;
  List<Category> nirbahi;
  List<Category> ethnic;

  AllHolidays3({
    this.christian,
    this.buddhist,
    this.general,
    this.hindu,
    this.muslim,
    this.nirbahi,
    this.ethnic,
  });

  factory AllHolidays3.fromJson(Map<String, dynamic> json) => AllHolidays3(
        christian: List<Category>.from(
            json["christian"].map((x) => Category.fromJson(x))),
        buddhist: List<Category>.from(
            json["buddhist"].map((x) => Category.fromJson(x))),
        general: List<Category>.from(
            json["general"].map((x) => Category.fromJson(x))),
        hindu:
            List<Category>.from(json["hindu"].map((x) => Category.fromJson(x))),
        muslim: List<Category>.from(
            json["muslim"].map((x) => Category.fromJson(x))),
        nirbahi: List<Category>.from(
            json["nirbahi"].map((x) => Category.fromJson(x))),
        ethnic: List<Category>.from(
            json["ethnic"].map((x) => Category.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "christian": List<dynamic>.from(christian.map((x) => x.toJson())),
        "buddhist": List<dynamic>.from(buddhist.map((x) => x.toJson())),
        "general": List<dynamic>.from(general.map((x) => x.toJson())),
        "hindu": List<dynamic>.from(hindu.map((x) => x.toJson())),
        "muslim": List<dynamic>.from(muslim.map((x) => x.toJson())),
        "nirbahi": List<dynamic>.from(nirbahi.map((x) => x.toJson())),
        "ethnic": List<dynamic>.from(ethnic.map((x) => x.toJson())),
      };
}

class Category {
  String dateTime;
  HasMulti hasMultiEvent;
  HasMulti hasMultiDate;
  String dateBangla;
  String monthBangla;
  String eventName;

  Category({
    this.dateTime,
    this.hasMultiEvent,
    this.hasMultiDate,
    this.dateBangla,
    this.monthBangla,
    this.eventName,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        dateTime: json["dateTime"],
        hasMultiEvent: hasMultiValues.map[json["hasMultiEvent"]],
        hasMultiDate: hasMultiValues.map[json["hasMultiDate"]],
        dateBangla: json["dateBangla"],
        monthBangla: json["monthBangla"],
        eventName: json["eventName"],
      );

  Map<String, dynamic> toJson() => {
        "dateTime": dateTime,
        "hasMultiEvent": hasMultiValues.reverse[hasMultiEvent],
        "hasMultiDate": hasMultiValues.reverse[hasMultiDate],
        "dateBangla": dateBangla,
        "monthBangla": monthBangla,
        "eventName": eventName,
      };
}

enum HasMulti { FALSE, TRUE }

final hasMultiValues =
    EnumValues({"FALSE": HasMulti.FALSE, "TRUE": HasMulti.TRUE});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
