CustomFunction cf = CustomFunction();

class CustomFunction {
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
