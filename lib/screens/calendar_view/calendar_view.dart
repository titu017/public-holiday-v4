import 'package:flutter/material.dart';
import 'package:publicholidayv4/components/custom_function.dart';
import 'package:publicholidayv4/models/holiday_data.dart';

class CalendarView extends StatefulWidget {
  static String id = "/calendar_view";
  @override
  _CalendarViewState createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
  DateTime pickedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    // DatePicker
    _customDatePicker() async {
      DateTime date = await showDatePicker(
        context: context,
        initialDate: pickedDate,
        firstDate: DateTime(DateTime.now().year - 10),
        lastDate: DateTime(DateTime.now().year + 10),
      );
      setState(() {
        pickedDate = date;
      });
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).padding.top,
            ),
            SizedBox(height: 20),
            Calendar(DateTime.now().month),
          ],
        ),
      ),
    );
  }
}

class Calendar extends StatefulWidget {
  final int monthNo;
  Calendar(this.monthNo);
  @override
  _CalendarState createState() => _CalendarState();
}

//class _CalendarState extends State<Calendar> {
//  int temp;
//  String monthName;
//  int noOfGrids;
//  int weekDayOfFirstDay;
//
//  @override
//  Widget build(BuildContext context) {
//    String getGridContent(int date) {
//      String gridContent;
//      if (date < 1) {
//        gridContent = " ";
//      } else {
//        gridContent = date.toString();
//      }
//      return gridContent;
//    }
//
//    return Column(
//      children: <Widget>[
//        // Month Title Bar
//        Container(
//          margin: EdgeInsets.only(left: 8, right: 8, bottom: 16),
//          decoration: BoxDecoration(
//            borderRadius: BorderRadius.circular(7),
//            color: Colors.green[800],
//          ),
//          child: Row(
//            mainAxisAlignment: MainAxisAlignment.spaceAround,
//            crossAxisAlignment: CrossAxisAlignment.center,
//            children: <Widget>[
//              IconButton(
//                iconSize: 40,
//                icon: Icon(
//                  Icons.arrow_left,
//                  color: Colors.white,
//                ),
//                onPressed: () {
//                  if (temp == null) temp = widget.monthNo;
//                  temp--;
//                  if (cf.isBetween(temp)) {
//                    setState(() {
//                      temp = temp;
//                      weekDayOfFirstDay =
//                          cf.firstDayOfSelectedMonth(temp).weekday;
//                    });
//                  } else {
//                    setState(() {
//                      temp = 12;
//                      weekDayOfFirstDay =
//                          cf.firstDayOfSelectedMonth(temp).weekday;
//                    });
//                  }
//                },
//              ),
//              Container(
//                width: MediaQuery.of(context).size.width / 2.5,
//                alignment: Alignment.center,
//                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//                child: Text(
//                  temp == null
//                      ? cf.toMonthString(widget.monthNo)
//                      : cf.toMonthString(temp),
//                  style: TextStyle(
//                    fontSize: 26,
//                    fontWeight: FontWeight.bold,
//                    color: Colors.white,
//                  ),
//                ),
//              ),
//              IconButton(
//                iconSize: 40,
//                icon: Icon(
//                  Icons.arrow_right,
//                  color: Colors.white,
//                ),
//                onPressed: () {
//                  if (temp == null) temp = widget.monthNo;
//                  temp++;
//                  if (cf.isBetween(temp)) {
//                    setState(() {
//                      temp = temp;
//                      weekDayOfFirstDay =
//                          cf.firstDayOfSelectedMonth(temp).weekday;
//                    });
//                  } else {
//                    setState(() {
//                      temp = 1;
//                      weekDayOfFirstDay =
//                          cf.firstDayOfSelectedMonth(temp).weekday;
//                    });
//                  }
//                },
//              ),
//            ],
//          ),
//        ),
//        // Week Days Row
//        Container(
//          padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 1.5),
//          child: MediaQuery.removePadding(
//            context: context,
//            removeBottom: true,
//            removeTop: true,
//            child: GridView.count(
//              shrinkWrap: true,
//              crossAxisCount: 7,
//              crossAxisSpacing: 3,
//              children: List.generate(7, (index) {
//                return Container(
//                  alignment: Alignment.center,
//                  decoration: BoxDecoration(
//                    borderRadius: BorderRadius.circular(7),
//                    color: Colors.green[900],
//                  ),
//                  child: Text(
//                    cf.toWeekDayString(index + 1).substring(0, 2),
//                    style: TextStyle(
//                      color: Colors.white,
//                      fontSize: 22,
//                      fontWeight: FontWeight.bold,
//                    ),
//                  ),
//                );
//              }),
//            ),
//          ),
//        ),
//        // Days of the Month
//        Padding(
//          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 1.5),
//          child: MediaQuery.removePadding(
//            context: context,
//            removeBottom: true,
//            removeTop: true,
//            child: GridView.count(
//              shrinkWrap: true,
//              mainAxisSpacing: 3,
//              crossAxisSpacing: 3,
//              crossAxisCount: 7,
//              children: List.generate(
//                weekDayOfFirstDay == null
//                    ? cf.noOfDaysInTheMonth(widget.monthNo) +
//                        cf.firstDayOfSelectedMonth(widget.monthNo).weekday -
//                        1
//                    : cf.noOfDaysInTheMonth(temp) + weekDayOfFirstDay - 1,
//                (index) {
//                  int date;
//                  if (weekDayOfFirstDay == null) {
//                    date = index +
//                        2 -
//                        cf.firstDayOfSelectedMonth(widget.monthNo).weekday;
//                  } else {
//                    date = index + 2 - weekDayOfFirstDay;
//                  }
//                  if (date < 1) {
//                    return Container(
//                      decoration: BoxDecoration(
//                        borderRadius: BorderRadius.circular(5),
//                      ),
//                      alignment: Alignment.center,
//                      child: Text(
//                        weekDayOfFirstDay == null
//                            ? getGridContent(date)
//                            : getGridContent(date),
//                        style: TextStyle(color: Colors.white, fontSize: 22),
//                      ),
//                    );
//                  } else {
//                    return RawMaterialButton(
//                      fillColor: Colors.green[800],
//                      child: Container(
//                        decoration: BoxDecoration(
//                          borderRadius: BorderRadius.circular(5),
//                        ),
//                        alignment: Alignment.center,
//                        child: Text(
//                          weekDayOfFirstDay == null
//                              ? getGridContent(date)
//                              : getGridContent(date),
//                          style: TextStyle(color: Colors.white, fontSize: 22),
//                        ),
//                      ),
//                      onPressed: () {},
//                    );
//                  }
//                },
//              ),
//            ),
//          ),
//        ),
//      ],
//    );
//  }
//}

class _CalendarState extends State<Calendar> {
  int temp;
  String monthName;
  int noOfGrids;
  int weekDayOfFirstDay;
  Color eventColor = Colors.green[800];
  bool hasEvent = false;

  @override
  Widget build(BuildContext context) {
    String getGridContent(int date) {
      String gridContent;
      if (date < 1) {
        gridContent = " ";
      } else {
        gridContent = date.toString();
      }
      return gridContent;
    }

    return FutureBuilder(
        future: DefaultAssetBundle.of(context)
            .loadString("assets/data/holiday_data.json"),
        builder: (context, snapshot) {
          List<DateTime> eventDateCollection = List<DateTime>();
          List<HolidayData> _holidayData;
          if (snapshot.hasData) {
            _holidayData = holidayDataFromJson(snapshot.data.toString());
            for (var holiday in _holidayData) {
              eventDateCollection.add(holiday.dateTime);
            }
          }
          return Column(
            children: <Widget>[
              // Month Title Bar
              Container(
                margin: EdgeInsets.only(left: 8, right: 8, bottom: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: Colors.green[800],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      iconSize: 40,
                      icon: Icon(
                        Icons.arrow_left,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        if (temp == null) temp = widget.monthNo;
                        temp--;
                        if (cf.isBetween(temp)) {
                          setState(() {
                            temp = temp;
                            weekDayOfFirstDay =
                                cf.firstDayOfSelectedMonth(temp).weekday;
                          });
                        } else {
                          setState(() {
                            temp = 12;
                            weekDayOfFirstDay =
                                cf.firstDayOfSelectedMonth(temp).weekday;
                          });
                        }
                      },
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 2.5,
                      alignment: Alignment.center,
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Text(
                        temp == null
                            ? cf.toMonthString(widget.monthNo)
                            : cf.toMonthString(temp),
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    IconButton(
                      iconSize: 40,
                      icon: Icon(
                        Icons.arrow_right,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        if (temp == null) temp = widget.monthNo;
                        temp++;
                        if (cf.isBetween(temp)) {
                          setState(() {
                            temp = temp;
                            weekDayOfFirstDay =
                                cf.firstDayOfSelectedMonth(temp).weekday;
                          });
                        } else {
                          setState(() {
                            temp = 1;
                            weekDayOfFirstDay =
                                cf.firstDayOfSelectedMonth(temp).weekday;
                          });
                        }
                      },
                    ),
                  ],
                ),
              ),
              // Week Days Row
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 1.5),
                child: MediaQuery.removePadding(
                  context: context,
                  removeBottom: true,
                  removeTop: true,
                  child: GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 7,
                    crossAxisSpacing: 3,
                    children: List.generate(7, (index) {
                      return Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: Colors.green[900],
                        ),
                        child: Text(
                          cf.toWeekDayString(index + 1).substring(0, 2),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),
              // Days of the Month
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 1.5),
                child: MediaQuery.removePadding(
                  context: context,
                  removeBottom: true,
                  removeTop: true,
                  child: GridView.count(
                    shrinkWrap: true,
                    mainAxisSpacing: 3,
                    crossAxisSpacing: 3,
                    crossAxisCount: 7,
                    children: List.generate(
                      weekDayOfFirstDay == null
                          ? cf.noOfDaysInTheMonth(widget.monthNo) +
                              cf
                                  .firstDayOfSelectedMonth(widget.monthNo)
                                  .weekday -
                              1
                          : cf.noOfDaysInTheMonth(temp) + weekDayOfFirstDay - 1,
                      (index) {
                        int date;
                        if (weekDayOfFirstDay == null) {
                          date = index +
                              2 -
                              cf
                                  .firstDayOfSelectedMonth(widget.monthNo)
                                  .weekday;
                        } else {
                          date = index + 2 - weekDayOfFirstDay;
                        }
                        int _month;
                        if (temp == null) {
                          _month = widget.monthNo;
                        } else {
                          _month = temp;
                        }
                        if (date < 1) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              weekDayOfFirstDay == null
                                  ? getGridContent(date)
                                  : getGridContent(date),
                              style:
                                  TextStyle(color: Colors.white, fontSize: 22),
                            ),
                          );
                        } else {
                          DateTime _dateTime =
                              cf.dateTimeGenerate(date, _month, 2020);
                          return RawMaterialButton(
                            fillColor: eventDateCollection.contains(_dateTime)
                                ? Colors.amber
                                : Colors.green[800],
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                getGridContent(date),
                                style: TextStyle(
                                  color: eventDateCollection.contains(_dateTime)
                                      ? Colors.black
                                      : Colors.white,
                                  fontSize: 22,
                                ),
                              ),
                            ),
                            onPressed: () {
                              if (eventDateCollection.contains(_dateTime)) {
                                showDialog(
                                  context: context,
                                  child: AlertDialog(
                                    title: Text("ok"),
                                  ),
                                );
                              }
                            },
                          );
                        }
                      },
                    ),
                  ),
                ),
              ),
            ],
          );
        });
  }
}
