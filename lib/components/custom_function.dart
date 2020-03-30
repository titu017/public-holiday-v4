import 'package:flutter/services.dart';
import 'package:publicholidayv4/models/holiday_data.dart';

CustomFunction cf = CustomFunction();

class CustomFunction {
  List<int> calculateGridElements(int noOfGrids, int weekDayOfFirstDay) {
    List<int> _dayList = List<int>();
    try {
      int lastDayOfGrid;
      noOfGrids > 35
          ? lastDayOfGrid = 7 - weekDayOfFirstDay + 1 + 28
          : lastDayOfGrid = noOfGrids - weekDayOfFirstDay + 1;
      if (noOfGrids > 35) {
        int rem = noOfGrids % 35;
        for (int i = 1; i <= 35; i++) {
          if (rem >= i) {
            _dayList.add(i + lastDayOfGrid);
          } else if (i > rem && i < weekDayOfFirstDay) {
            _dayList.add(-1);
          } else {
            _dayList.add(i - weekDayOfFirstDay + 1);
          }
        }
      } else {
        for (int i = 1; i <= noOfGrids; i++) {
          if (i < weekDayOfFirstDay) {
            _dayList.add(-1);
          } else {
            _dayList.add(i - weekDayOfFirstDay + 1);
          }
        }
      }
      return _dayList;
    } catch (e) {
      print("error caught while creating list of grid elements");
      return _dayList;
    }
  }

  // Pie Chart Data Map
  Map dataMapForSingleMonthVSyear(int monthNo, double length1, double length2) {
    Map<String, double> dataMap = new Map();
    dataMap.putIfAbsent(cf.toMonthString(monthNo), () => length1);
    dataMap.putIfAbsent("All Holidays", () => length2);
    return dataMap;
  }

  // Event Date Collection
  List<DateTime> eventDateCollection(List<HolidayData> holidayDataList) {
    List<DateTime> collection = List<DateTime>();
    for (var holiday in holidayDataList) {
      collection.add(holiday.dateTime);
    }
    return collection;
  }

  Future<List<HolidayData>> fetchAllData() async {
    List<HolidayData> listOfHoliday;
    await rootBundle.loadString("assets/data/holiday_data.json").then((value) {
      listOfHoliday = holidayDataFromJson(value);
    });
//    print(listOfHoliday[0].dateTime);
    return listOfHoliday;
  }

  // Holiday Count in a Month
  double holidayCounterInMonth(int month, List<HolidayData> holidayData) {
    int counter = 0;
    List<DateTime> allCollection = eventDateCollection(holidayData);
    for (var collection in allCollection) {
      if (collection.month == month) {
        counter++;
      }
    }
    return double.parse("$counter");
  }

  // DateTime Generator from String
  DateTime dateTimeGenerate(int day, int month, int year) {
    String dayS, monthS;
    if (day.toString().length == 1) {
      dayS = "0$day";
    } else {
      dayS = "$day";
    }
    if (month.toString().length == 1) {
      monthS = "0$month";
    } else {
      monthS = "$month";
    }
    return DateTime.parse("$year-$monthS-$dayS");
  }

  // First Day of the Selected Month
  DateTime firstDayOfSelectedMonth(int monthNO) {
    if (monthNO.toString().length == 1) {
      return DateTime.parse("2020-0$monthNO-01");
    } else {
      return DateTime.parse("2020-$monthNO-01");
    }
  }

  // Month range checker
  bool isBetween(int month) {
    if (month >= 1 && month <= 12) {
      return true;
    } else
      return false;
  }

  // Total Days in the selected month
  int noOfDaysInTheMonth(int month) {
    int days;
    switch (month) {
      case 1:
        {
          days = 31;
        }
        break;
      //TODO:: have to check leap year
      case 2:
        {
          days = 29;
        }
        break;
      case 3:
        {
          days = 31;
        }
        break;
      case 4:
        {
          days = 30;
        }
        break;
      case 5:
        {
          days = 31;
        }
        break;
      case 6:
        {
          days = 30;
        }
        break;
      case 7:
        {
          days = 31;
        }
        break;
      case 8:
        {
          days = 31;
        }
        break;
      case 9:
        {
          days = 30;
        }
        break;
      case 10:
        {
          days = 31;
        }
        break;
      case 11:
        {
          days = 30;
        }
        break;
      case 12:
        {
          days = 31;
        }
        break;
    }

    return days;
  }

  // To Make an output as a Month Name
  String toMonthString(int monthNo) {
    String month;
    if (monthNo == 01) {
      month = "January";
    } else if (monthNo == 02) {
      month = "February";
    } else if (monthNo == 03) {
      month = "March";
    } else if (monthNo == 04) {
      month = "April";
    } else if (monthNo == 05) {
      month = "May";
    } else if (monthNo == 06) {
      month = "June";
    } else if (monthNo == 07) {
      month = "July";
    } else if (monthNo == 08) {
      month = "August";
    } else if (monthNo == 09) {
      month = "September";
    } else if (monthNo == 10) {
      month = "October";
    } else if (monthNo == 11) {
      month = "November";
    } else if (monthNo == 12) {
      month = "December";
    } else {
      month = "Month Error";
    }
    return month;
  }

  // To Format WEEKDAY like "Sunday" use this method
  String toWeekDayString(int weekDay) {
    String day;
    if (weekDay == 1) {
      day = "Monday";
    } else if (weekDay == 2) {
      day = "Tuesday";
    } else if (weekDay == 3) {
      day = "Wednesday";
    } else if (weekDay == 4) {
      day = "Thursday";
    } else if (weekDay == 5) {
      day = "Friday";
    } else if (weekDay == 6) {
      day = "Saturday";
    } else if (weekDay == 7) {
      day = "Sunday";
    } else {
      day = "Weekday Error";
    }
    return day;
  }
}
