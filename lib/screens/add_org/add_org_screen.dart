import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class addOrgPage extends StatelessWidget {
  final _nc = TextEditingController();
  final _dc = TextEditingController();
  void dispose() {
    _nc.dispose();
    _dc.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text("Name:"),
            TextField(controller: _nc),
            Text("Description:"),
            TextField(controller: _dc),
            TextButton(
              child: Text("Add an org"),
              onPressed: () async {
                var firebase = FirebaseFirestore.instance;                
                User? user = FirebaseAuth.instance.currentUser;
                firebase.collection('organizations').add(
                {
                  "name": _nc.text,
                  "description": _dc.text,
                  "owner": "${user?.uid ?? ''}",
                  "opportunities": []
                }
                );
                Navigator.pop(context);
              }
            )
          ],
        )
      )
    );
  }
}
