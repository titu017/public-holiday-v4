import 'package:flutter/material.dart';
import 'package:publicholidayv4/screens/holiday_category.dart';

class CardView extends StatefulWidget {
  static String id = "card_view";
  @override
  _CardViewState createState() => _CardViewState();
}

class _CardViewState extends State<CardView> {
  String appBarTitle = "সকল ছুটি";

  @override
  Widget build(BuildContext context) {
    List<String> categoryNames = [
      "সকল ছুটি",
      "সাধারণ ছুটি",
      "ঐচ্ছিক ছুটি (মুসলিম পর্ব)",
      "নির্বাহী আদেশে সরকারি ছুটি",
      "ঐচ্ছিক ছুটি (হিন্দু পর্ব)",
      "ঐচ্ছিক ছুটি (খ্রিষ্টান পর্ব)",
      "ঐচ্ছিক ছুটি (বৌদ্ধ পর্ব)",
      "ঐচ্ছিক ছুটি (ক্ষুদ্র নৃগোষ্ঠী)"
    ];

    DateTime x = DateTime.parse("2020-03-26");
    print(x);
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle == null ? categoryNames[0] : appBarTitle),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).padding.top,
              color: Colors.amber,
            ),
            Container(
              height: 200,
              width: double.infinity,
              color: Colors.amber,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemCount: categoryNames.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(categoryNames[index]),
                  leading: Icon(
                    Icons.person,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    setState(() {
                      appBarTitle = categoryNames[index];
                    });
                  },
                );
              },
            ),
          ],
        ),
      ),
      body: HolidayCategory(appBarTitle),
    );
  }
}
