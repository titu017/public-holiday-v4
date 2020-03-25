import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  final String eventName;
  final String dateEnglish;
  final String monthEnglish;
  final String weekDay;
  final String eventDetails;
  EventCard(
      {@required this.weekDay,
      @required this.eventName,
      @required this.dateEnglish,
      @required this.eventDetails,
      @required this.monthEnglish,
      Key key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final leftWidth = deviceWidth * 66 / 100;
    final rightWidth = deviceWidth * 26 / 100;
    final horizontalPaddingMargin = deviceWidth * 2 / 100;
    return Container(
      color: Colors.green,
      width: double.infinity,
      margin: EdgeInsets.all(horizontalPaddingMargin),
      padding: EdgeInsets.all(horizontalPaddingMargin),
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Row(
              children: <Widget>[
                Container(
                  width: leftWidth,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(eventName),
                      Text(weekDay),
                    ],
                  ),
                ),
                Container(
                  width: rightWidth,
                  child: Column(
                    children: <Widget>[
                      Text(dateEnglish),
                      Text(monthEnglish),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            child: Text(eventDetails),
          ),
        ],
      ),
    );
  }
}
