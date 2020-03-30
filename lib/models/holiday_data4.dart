// To parse this JSON data, do
//
//     final allHolidays4 = allHolidays4FromJson(jsonString);

import 'dart:convert';

AllHolidays4 allHolidays4FromJson(String str) =>
    AllHolidays4.fromJson(json.decode(str));

String allHolidays4ToJson(AllHolidays4 data) => json.encode(data.toJson());

class AllHolidays4 {
  Compulsory compulsory;
  Optional optional;

  AllHolidays4({
    this.compulsory,
    this.optional,
  });

  factory AllHolidays4.fromJson(Map<String, dynamic> json) => AllHolidays4(
        compulsory: Compulsory.fromJson(json["compulsory"]),
        optional: Optional.fromJson(json["optional"]),
      );

  Map<String, dynamic> toJson() => {
        "compulsory": compulsory.toJson(),
        "optional": optional.toJson(),
      };
}

class Compulsory {
  List<Category> general;
  List<Category> nirbahi;

  Compulsory({
    this.general,
    this.nirbahi,
  });

  factory Compulsory.fromJson(Map<String, dynamic> json) => Compulsory(
        general: List<Category>.from(
            json["general"].map((x) => Category.fromJson(x))),
        nirbahi: List<Category>.from(
            json["nirbahi"].map((x) => Category.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "general": List<dynamic>.from(general.map((x) => x.toJson())),
        "nirbahi": List<dynamic>.from(nirbahi.map((x) => x.toJson())),
      };
}

class Category {
  String dateTime;
  bool hasMultiEvent;
  bool hasMultiDate;
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
        hasMultiEvent: json["hasMultiEvent"],
        hasMultiDate: json["hasMultiDate"],
        dateBangla: json["dateBangla"],
        monthBangla: json["monthBangla"],
        eventName: json["eventName"],
      );

  Map<String, dynamic> toJson() => {
        "dateTime": dateTime,
        "hasMultiEvent": hasMultiEvent,
        "hasMultiDate": hasMultiDate,
        "dateBangla": dateBangla,
        "monthBangla": monthBangla,
        "eventName": eventName,
      };
}

class Optional {
  List<Category> christian;
  List<Category> buddhist;
  List<Category> hindu;
  List<Category> muslim;
  List<Category> ethnic;

  Optional({
    this.christian,
    this.buddhist,
    this.hindu,
    this.muslim,
    this.ethnic,
  });

  factory Optional.fromJson(Map<String, dynamic> json) => Optional(
        christian: List<Category>.from(
            json["christian"].map((x) => Category.fromJson(x))),
        buddhist: List<Category>.from(
            json["buddhist"].map((x) => Category.fromJson(x))),
        hindu:
            List<Category>.from(json["hindu"].map((x) => Category.fromJson(x))),
        muslim: List<Category>.from(
            json["muslim"].map((x) => Category.fromJson(x))),
        ethnic: List<Category>.from(
            json["ethnic"].map((x) => Category.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "christian": List<dynamic>.from(christian.map((x) => x.toJson())),
        "buddhist": List<dynamic>.from(buddhist.map((x) => x.toJson())),
        "hindu": List<dynamic>.from(hindu.map((x) => x.toJson())),
        "muslim": List<dynamic>.from(muslim.map((x) => x.toJson())),
        "ethnic": List<dynamic>.from(ethnic.map((x) => x.toJson())),
      };
}
