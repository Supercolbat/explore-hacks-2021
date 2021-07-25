import 'package:cloud_firestore/cloud_firestore.dart';

class Organization {
  String name;
  String description;
  List<dynamic> opportunities;
  // List<DocumentReference> owners;
  // DocumentReference type;
  //List<String> opportunities;
  String owner;

  Organization(
      {required this.name,
      required this.description,
      required this.opportunities,
      required this.owner});
}
