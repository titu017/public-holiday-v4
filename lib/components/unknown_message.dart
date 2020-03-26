import 'package:flutter/material.dart';

class ShowUnknownMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.lightGreenAccent,
      child: Center(
        child:
            Text("Some Unknown problem occurred. We are fixing them quickly."),
      ),
    );
  }
}
