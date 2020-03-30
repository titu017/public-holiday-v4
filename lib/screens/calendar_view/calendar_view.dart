import 'package:flutter/material.dart';
import 'package:publicholidayv4/components/custom_function2.dart';
import 'package:publicholidayv4/models/main_data_model.dart';

class CalendarView extends StatefulWidget {
  static String id = "/calendar_view";
  @override
  _CalendarViewState createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
  DateTime pickedDate = DateTime.now();
  List<AllHolidayData> listOfAllHolidays = List<AllHolidayData>();
  int pickedMonthNo = DateTime.now().month;
  int temp;
  String monthName;
  int noOfGrids;
  int weekDayOfFirstDay;
  Color eventColor = Colors.green[800];
  bool hasEvent = false;
  List<int> _dayList;

  @override
  void initState() {
    cf2.fetchAllData().then((value) {
      listOfAllHolidays = value;
    });
    temp = DateTime.now().month;
    weekDayOfFirstDay = cf2.firstDayOfSelectedMonth(pickedMonthNo).weekday;
    noOfGrids = cf2.noOfDaysInTheMonth(temp) + weekDayOfFirstDay - 1;
    _dayList = cf2.calculateGridElements(noOfGrids, weekDayOfFirstDay);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<DateTime> eventDateCollection =
        cf2.eventDateCollection(listOfAllHolidays);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // Padding for safe area
            Container(
              height: MediaQuery.of(context).padding.top,
            ),
            SizedBox(height: 20),
            // Month Name, Previous and Next Month bar
            Container(
              margin: EdgeInsets.only(left: 8, right: 8, bottom: 12),
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
                      if (temp == null) temp = pickedMonthNo;
                      temp--;
                      if (cf2.isBetween(temp)) {
                        temp = temp;
                      } else {
                        temp = 12;
                      }
                      setState(() {
                        temp = temp;
                        weekDayOfFirstDay =
                            cf2.firstDayOfSelectedMonth(temp).weekday;
                        noOfGrids = cf2.noOfDaysInTheMonth(temp) +
                            weekDayOfFirstDay -
                            1;
                        _dayList = cf2.calculateGridElements(
                            noOfGrids, weekDayOfFirstDay);
                      });
                    },
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2.5,
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Text(
                      temp == null
                          ? cf2.toMonthString(pickedMonthNo)
                          : cf2.toMonthString(temp),
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
                      if (temp == null) temp = pickedMonthNo;
                      temp++;
                      if (cf2.isBetween(temp)) {
                        temp = temp;
                      } else {
                        temp = 1;
                      }
                      setState(() {
                        temp = temp;
                        weekDayOfFirstDay =
                            cf2.firstDayOfSelectedMonth(temp).weekday;
                        noOfGrids = cf2.noOfDaysInTheMonth(temp) +
                            weekDayOfFirstDay -
                            1;
                        _dayList = cf2.calculateGridElements(
                            noOfGrids, weekDayOfFirstDay);
                      });
                    },
                  ),
                ],
              ),
            ),
            // Week Days Row
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.5),
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
                        cf2.toWeekDayString(index + 1).substring(0, 2),
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
                    _dayList.length,
                    (index) {
                      if (_dayList[index] < 0) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            " ",
                            style: TextStyle(color: Colors.white, fontSize: 22),
                          ),
                        );
                      } else {
                        DateTime _dateTime =
                            cf2.dateTimeGenerate(_dayList[index], temp, 2020);
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
                              "${_dayList[index]}",
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
        ),
      ),
    );
  }
}
