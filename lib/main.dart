import 'package:flutter/material.dart';
import 'package:publicholidayv4/admin/admin.dart';
import 'package:publicholidayv4/screens/wrapper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Public Holiday',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Wrapper(),
    );
  }
}
