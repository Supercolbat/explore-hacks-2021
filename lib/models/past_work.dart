import 'package:cloud_firestore/cloud_firestore.dart';

class PastWork {
  DateTime date;
  String description;
  String name;
  DocumentReference organization;
  int hours;
  bool attended;

  PastWork(
      {required this.date,
      required this.description,
      required this.name,
      required this.organization,
      required this.hours,
      required this.attended});
}
