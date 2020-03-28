import 'package:flutter/material.dart';
import 'package:publicholidayv4/screens/calendar_view/calendar_view.dart';
import 'package:publicholidayv4/screens/details_screen.dart';
import 'package:publicholidayv4/screens/wrapper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Public Holiday',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      routes: <String, WidgetBuilder>{
        "/": (_) => CalendarView(),
        CardView.id: (_) => CardView(),
        CalendarView.id: (_) => CalendarView(),
        DetailsScreen.id: (_) => DetailsScreen(),
      },
    );
  }
}
