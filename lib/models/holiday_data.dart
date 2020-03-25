// To parse this JSON data, do
//
//     final holidayData = holidayDataFromJson(jsonString);

import 'dart:convert';

HolidayData holidayDataFromJson(String str) =>
    HolidayData.fromJson(json.decode(str));

String holidayDataToJson(HolidayData data) => json.encode(data.toJson());

class HolidayData {
  List<Datum> data;

  HolidayData({
    this.data,
  });

  factory HolidayData.fromJson(Map<String, dynamic> json) => HolidayData(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  String category;
  String dateEnglish;
  String monthEnglish;
  DateTime dateTime;
  String dateBangla;
  String monthBangla;
  String weekDay;
  String eventName;
  String details;

  Datum({
    this.category,
    this.dateEnglish,
    this.monthEnglish,
    this.dateTime,
    this.dateBangla,
    this.monthBangla,
    this.weekDay,
    this.eventName,
    this.details,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        category: json["category"],
        dateEnglish: json["dateEnglish"],
        monthEnglish: json["monthEnglish"],
        dateTime: DateTime.parse(json["dateTime"]),
        dateBangla: json["dateBangla"],
        monthBangla: json["monthBangla"],
        weekDay: json["weekDay"],
        eventName: json["eventName"],
        details: json["details"],
      );

  Map<String, dynamic> toJson() => {
        "category": category,
        "dateEnglish": dateEnglish,
        "monthEnglish": monthEnglish,
        "dateTime":
            "${dateTime.year.toString().padLeft(4, '0')}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}",
        "dateBangla": dateBangla,
        "monthBangla": monthBangla,
        "weekDay": weekDay,
        "eventName": eventName,
        "details": details,
      };
}
