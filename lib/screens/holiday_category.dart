import 'package:flutter/material.dart';
import 'package:publicholidayv4/components/error_message.dart';
import 'package:publicholidayv4/components/event_card.dart';
import 'package:publicholidayv4/components/unknown_message.dart';
import 'package:publicholidayv4/models/holiday_data.dart';

class HolidayCategory extends StatefulWidget {
  final String category;
  const HolidayCategory(this.category);
  @override
  _HolidayCategoryState createState() => _HolidayCategoryState();
}

class _HolidayCategoryState extends State<HolidayCategory> {
  @override
  Widget build(BuildContext context) {
    final cat = widget.category;

    _showDetails(HolidayData holidayData) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(holidayData.eventName),
                  Text(holidayData.details),
                ],
              ),
            ),
            backgroundColor: Colors.amber,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text(
                  "Details",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                textColor: Colors.red,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
    }

    return FutureBuilder(
      future: DefaultAssetBundle.of(context)
          .loadString("assets/data/holiday_data.json"),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final allData = holidayDataFromJson(snapshot.data.toString());
          return ListView.builder(
            itemCount: allData.length,
            itemBuilder: (context, index) {
              final cardData = allData[index];
              if (cat == "সকল ছুটি") {
                return EventCard(
                  eventName: cardData.eventName,
                  dateEnglish: cardData.dateEnglish,
                  monthEnglish: cardData.monthEnglish,
                  weekDay: cardData.weekDay,
                  eventDetails: cardData.details,
                  onPressed: () {
                    _showDetails(cardData);
                  },
                );
              } else if (cardData.category == cat) {
                return EventCard(
                  eventName: cardData.eventName,
                  dateEnglish: cardData.dateEnglish,
                  monthEnglish: cardData.monthEnglish,
                  weekDay: cardData.weekDay,
                  eventDetails: cardData.details,
                  onPressed: () {
                    _showDetails(cardData);
                  },
                );
              } else {
                return Container();
              }
            },
          );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return LinearProgressIndicator();
        } else if (snapshot.hasError) {
          return ShowErrorMessage();
        } else {
          return ShowUnknownMessage();
        }
      },
    );
  }
}
