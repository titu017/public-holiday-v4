import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final fs = Firestore.instance;

  Future addEvent(String lang, String cat, DateTime dateTime, String eventName,
      String history) async {
    Timestamp timestamp = Timestamp.fromDate(dateTime);
    await fs.collection("root").document("holidays").collection(lang).add({
      "lang": lang,
      "cat": cat,
      "dateTime": timestamp,
      "eventName": eventName,
      "history": history,
    });
  }
}
