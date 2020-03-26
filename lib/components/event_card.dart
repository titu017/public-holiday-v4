import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  final String eventName;
  final String dateEnglish;
  final String monthEnglish;
  final String weekDay;
  final String eventDetails;
  final GestureTapCallback onPressed;
  EventCard(
      {@required this.weekDay,
      @required this.eventName,
      @required this.dateEnglish,
      @required this.eventDetails,
      @required this.monthEnglish,
      @required this.onPressed,
      Key key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final leftWidth = deviceWidth * 66 / 100;
    final rightWidth = deviceWidth * 26 / 100;
    final horizontalPaddingMargin = deviceWidth * 2 / 100;
    return Padding(
      padding: EdgeInsets.all(horizontalPaddingMargin),
      child: RawMaterialButton(
        fillColor: Colors.amber,
        splashColor: Colors.amberAccent,
        onPressed: onPressed,
        child: Container(
          width: double.infinity,
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
        ),
      ),
    );
  }
}
