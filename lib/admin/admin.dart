import 'package:flutter/material.dart';

class AdminConsole extends StatefulWidget {
  @override
  _AdminConsoleState createState() => _AdminConsoleState();
}

class _AdminConsoleState extends State<AdminConsole> {
  @override
  Widget build(BuildContext context) {
    _addEvent() {}

    return Scaffold(
      appBar: AppBar(
        title: Text("Admin Console"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _addEvent(),
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Container(),
          ],
        ),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemCount: 3,
        itemBuilder: (context, index) {
          return Container(
            child: Text("event"),
          );
        },
      ),
    );
  }
}
