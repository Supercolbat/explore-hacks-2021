import 'package:cloud_firestore/cloud_firestore.dart';

class Organization {
  String name;
  String description;
  // List<DocumentReference> opportunities;
  // List<DocumentReference> owners;
  // DocumentReference type;
  List<String> opportunities;
  List<String> owners;

  Organization(
      {required this.name,
      required this.description,
      required this.opportunities,
      required this.owners});
}
