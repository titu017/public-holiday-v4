import 'package:flutter/material.dart';

class ShowErrorMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.red,
      child: Center(
        child: Text("Some Error Ocurred"),
      ),
    );
  }
}
