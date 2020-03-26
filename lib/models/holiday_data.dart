// To parse this JSON data, do
//
//     final holidayData = holidayDataFromJson(jsonString);

import 'dart:convert';

List<HolidayData> holidayDataFromJson(String str) => List<HolidayData>.from(
    json.decode(str).map((x) => HolidayData.fromJson(x)));

String holidayDataToJson(List<HolidayData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HolidayData {
  String category;
  String dateEnglish;
  String monthEnglish;
  DateTime dateTime;
  String dateBangla;
  String monthBangla;
  String weekDay;
  String eventName;
  String details;

  HolidayData({
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

  factory HolidayData.fromJson(Map<String, dynamic> json) => HolidayData(
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
