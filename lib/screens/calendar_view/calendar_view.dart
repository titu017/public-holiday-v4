import 'package:flutter/material.dart';
import 'package:publicholidayv4/components/custom_function.dart';

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

class _CalendarState extends State<Calendar> {
  int temp;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          color: Colors.green[800],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.arrow_left,
                  size: 40,
                  color: Colors.white,
                ),
                onPressed: () {
                  if (temp == null) temp = widget.monthNo;
                  temp--;
                  if (cf.isBetween(temp)) {
                    setState(() {
                      temp = temp;
                    });
                  } else {
                    setState(() {
                      temp = 12;
                    });
                  }
                },
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Text(
                  "March",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.arrow_right,
                  size: 40,
                  color: Colors.white,
                ),
                onPressed: () {
                  if (temp == null) temp = widget.monthNo;
                  temp++;
                  if (cf.isBetween(temp)) {
                    setState(() {
                      temp = temp;
                    });
                  } else {
                    setState(() {
                      temp = 1;
                    });
                  }
                },
              ),
            ],
          ),
        ),
        GridView.count(
          shrinkWrap: true,
          crossAxisCount: 7,
          children: List.generate(
            temp == null
                ? cf.noOfDaysInTheMonth(widget.monthNo)
                : cf.noOfDaysInTheMonth(temp),
            (index) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.green[800],
                ),
                margin: EdgeInsets.all(3),
                alignment: Alignment.center,
                child: Text(
                  "${index + 1}",
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
