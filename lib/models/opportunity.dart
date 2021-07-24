import 'package:cloud_firestore/cloud_firestore.dart';

class Opportunity {
  String address;
  int avaiableSpots;
  DateTime date;
  String description;
  String name;
  String organization;
  DocumentReference doc;

  Opportunity(
      {required this.address,
      required this.avaiableSpots,
      required this.date,
      required this.description,
      required this.name,
      required this.organization,
      required this.doc});
}
