import 'package:flutter/material.dart';
import 'package:publicholidayv4/components/custom_function.dart';
import 'package:publicholidayv4/models/holiday_data.dart';
import 'package:pie_chart/pie_chart.dart';

class CalendarView extends StatefulWidget {
  static String id = "/calendar_view";
  @override
  _CalendarViewState createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
  DateTime pickedDate = DateTime.now();
  List<HolidayData> listOfHoliday = List<HolidayData>();
  int pickedMonthNo = DateTime.now().month;
  int temp;
  String monthName;
  int noOfGrids;
  int weekDayOfFirstDay;
  Color eventColor = Colors.green[800];
  bool hasEvent = false;

  @override
  void initState() {
    cf.fetchAllData().then((value) {
      listOfHoliday = value;
    });
    temp = DateTime.now().month;
    weekDayOfFirstDay = cf.firstDayOfSelectedMonth(pickedMonthNo).weekday;
    noOfGrids = cf.noOfDaysInTheMonth(temp) + weekDayOfFirstDay - 1;
    super.initState();
  }

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

    List<Color> colorList = [
      Colors.amber,
      Colors.green,
      Colors.redAccent,
      Colors.blueAccent,
      Colors.greenAccent
    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).padding.top,
            ),
            SizedBox(height: 20),
            FutureBuilder(
                future: DefaultAssetBundle.of(context)
                    .loadString("assets/data/holiday_data.json"),
                builder: (context, snapshot) {
                  List<DateTime> eventDateCollection = List<DateTime>();
                  List<HolidayData> _holidayData;
                  if (snapshot.hasData) {
                    _holidayData =
                        holidayDataFromJson(snapshot.data.toString());
                    eventDateCollection = cf.eventDateCollection(_holidayData);
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
                                if (temp == null) temp = pickedMonthNo;
                                temp--;
                                if (cf.isBetween(temp)) {
                                  temp = temp;
                                } else {
                                  temp = 12;
                                }
                                setState(() {
                                  temp = temp;
                                  weekDayOfFirstDay =
                                      cf.firstDayOfSelectedMonth(temp).weekday;
                                  noOfGrids = cf.noOfDaysInTheMonth(temp) +
                                      weekDayOfFirstDay -
                                      1;
                                });
                              },
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 2.5,
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: Text(
                                temp == null
                                    ? cf.toMonthString(pickedMonthNo)
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
                                if (temp == null) temp = pickedMonthNo;
                                temp++;
                                if (cf.isBetween(temp)) {
                                  temp = temp;
                                } else {
                                  temp = 1;
                                }
                                setState(() {
                                  temp = temp;
                                  weekDayOfFirstDay =
                                      cf.firstDayOfSelectedMonth(temp).weekday;
                                  noOfGrids = cf.noOfDaysInTheMonth(temp) +
                                      weekDayOfFirstDay -
                                      1;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      // Week Days Row
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 1.5),
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 1.5),
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
                              noOfGrids,
                              (index) {
                                int date = index + 2 - weekDayOfFirstDay;
                                int _month = temp;
                                if (date < 1) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      getGridContent(date),
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 22),
                                    ),
                                  );
                                } else {
                                  DateTime _dateTime =
                                      cf.dateTimeGenerate(date, _month, 2020);
                                  return RawMaterialButton(
                                    fillColor:
                                        eventDateCollection.contains(_dateTime)
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
                                          color: eventDateCollection
                                                  .contains(_dateTime)
                                              ? Colors.black
                                              : Colors.white,
                                          fontSize: 22,
                                        ),
                                      ),
                                    ),
                                    onPressed: () {
                                      if (eventDateCollection
                                          .contains(_dateTime)) {
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
                }),
            SizedBox(height: 20),

            // pie chart starts from here
            PieChart(
              //TODO:  have to check this one when app starts for the first time
              dataMap: cf.dataMapForSingleMonthVSyear(
                temp,
                cf.holidayCounterInMonth(temp, listOfHoliday),
                double.parse("${listOfHoliday.length}"),
              ),
              colorList: colorList,
            ),
          ],
        ),
      ),
    );
  }
}
