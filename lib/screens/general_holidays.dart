import 'package:flutter/material.dart';
import 'package:publicholidayv4/components/event_card.dart';
import 'package:publicholidayv4/models/holiday_data.dart';

class GeneralHolidays extends StatefulWidget {
  @override
  _GeneralHolidaysState createState() => _GeneralHolidaysState();
}

class _GeneralHolidaysState extends State<GeneralHolidays> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DefaultAssetBundle.of(context)
          .loadString("assets/data/holiday_data.json"),
      builder: (context, snapshot) {
        final allData = holidayDataFromJson(snapshot.data.toString()).data;
        return ListView.builder(
          itemCount: allData.length,
          itemBuilder: (context, index) {
            final cardData = allData[index];
            if (cardData.category == "সাধারণ ছুটি") {
              return EventCard(
                eventName: cardData.eventName,
                dateEnglish: cardData.dateEnglish,
                monthEnglish: cardData.monthEnglish,
                weekDay: cardData.weekDay,
                eventDetails: cardData.details,
              );
            } else {
              return Container();
            }
          },
        );
      },
    );
  }
}
