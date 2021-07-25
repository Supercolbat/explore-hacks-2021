import 'package:cloud_firestore/cloud_firestore.dart';

class Opportunity {
  String id;
  String address;
  int availableSpots;
  DateTime date;
  String description;
  String name;

  Opportunity({
    required this.id,
    required this.address,
    required this.availableSpots,
    required this.date,
    required this.description,
    required this.name,
  });
}
