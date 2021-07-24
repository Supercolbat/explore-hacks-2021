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
          print(snapshot.data.?docs);
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
                    items: [
                      DropdownMenuItem(
                        child: Text("eeby"),
                        value: "deeby"
                      ),
                      DropdownMenuItem(
                        child: Text("deeby"),
                        value: "eeby"
                      )
                    ]
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
