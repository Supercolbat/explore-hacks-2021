import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
/*
address
availableSpots
date
description
hours
name
organzation
*/
class addOppScreen extends StatefulWidget {
  addOppScreenState createState () => addOppScreenState();
}
class addOppScreenState extends State<addOppScreen> {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FirebaseFirestore.instance.collection('organizations').get(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          String orgname = "";
          var orgs = (snapshot.data! as QuerySnapshot).docs;
          List<DropdownMenuItem<String>> items = orgs.map((f) => new DropdownMenuItem(
            child: Text(f.get("name").toString()),
            value: f.get("name").toString()
          )).toList();
          return Scaffold(
            body: Center(
              child: Column(
                children: [
                  Text("Name:"),
                  Text("Namefield"),
                  Text("Description"),
                  Text("Desctext"),
                  Text("Address:"),
                  Text("Addrtext"),
                  Text("organization:"),
                  DropdownButton(
                    value: orgname,
                    items: items,
                    hint: Text("Organization")
                  )
                ]
              )
            )
          );
        }
        return Text("Loading");
      }
    );
  }
}
