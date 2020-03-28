import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  static String id = "/details_screen";
  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    String appBarTitle = "Event Title";
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle ?? " "),
        centerTitle: true,
      ),
      body: Container(),
    );
  }
}
