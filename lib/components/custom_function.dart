CustomFunction cf = CustomFunction();

class CustomFunction {
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
  String toMonthString(DateTime dateTime) {
    int months = dateTime.month;
    String month;
    if (months == 01) {
      month = "January";
    } else if (months == 02) {
      month = "February";
    } else if (months == 03) {
      month = "March";
    } else if (months == 04) {
      month = "April";
    } else if (months == 05) {
      month = "May";
    } else if (months == 06) {
      month = "June";
    } else if (months == 07) {
      month = "July";
    } else if (months == 08) {
      month = "August";
    } else if (months == 09) {
      month = "September";
    } else if (months == 10) {
      month = "October";
    } else if (months == 11) {
      month = "November";
    } else if (months == 12) {
      month = "December";
    } else {
      month = "Month Error";
    }
    return month;
  }

  // To Format WEEKDAY like "Sunday" use this method
  String toWeekDayString(DateTime dateTime) {
    int weekDay = dateTime.weekday;
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
