// To parse this JSON data, do
//
//     final allHolidays2 = allHolidays2FromJson(jsonString);

import 'dart:convert';

List<AllHolidayData> allHolidayDataFromJson(String str) =>
    List<AllHolidayData>.from(
        json.decode(str).map((x) => AllHolidayData.fromJson(x)));

String allHolidayDataToJson(List<AllHolidayData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AllHolidayData {
  String category;
  String dateTime;
  bool hasMultiEvent;
  bool hasMultiDate;
  String dateBangla;
  String monthBangla;
  String eventName;

  AllHolidayData({
    this.category,
    this.dateTime,
    this.hasMultiEvent,
    this.hasMultiDate,
    this.dateBangla,
    this.monthBangla,
    this.eventName,
  });

  factory AllHolidayData.fromJson(Map<String, dynamic> json) => AllHolidayData(
        category: json["category"],
        dateTime: json["dateTime"],
        hasMultiEvent: json["hasMultiEvent"],
        hasMultiDate: json["hasMultiDate"],
        dateBangla: json["dateBangla"],
        monthBangla: json["monthBangla"],
        eventName: json["eventName"],
      );

  Map<String, dynamic> toJson() => {
        "category": category,
        "dateTime": dateTime,
        "hasMultiEvent": hasMultiEvent,
        "hasMultiDate": hasMultiDate,
        "dateBangla": dateBangla,
        "monthBangla": monthBangla,
        "eventName": eventName,
      };
}
