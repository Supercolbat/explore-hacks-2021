import 'package:explore_hacks_2021/constants/colors.dart';
import 'package:explore_hacks_2021/nav.dart';
import 'package:explore_hacks_2021/screens/organizations/orgs_screen.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_svg/flutter_svg.dart';

class addOrgPage extends StatefulWidget {
  addOrgPageState createState() => addOrgPageState();
}

class addOrgPageState extends State<addOrgPage> {
  final _nc = TextEditingController();
  final _dc = TextEditingController();
  void dispose() {
    _nc.dispose();
    _dc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: size.height,
        color: ColorPalette.purple50,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 25, vertical: 40),
          height: size.height,
          child: ListView(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: SvgPicture.asset(
                    'assets/images/left-arrow.svg',
                    width: 50,
                  ),
                ),
              ),
              SizedBox(height: 30),
              Text(
                "Name:",
                style: TextStyle(
                  fontFamily: "Geometria",
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
              TextField(
                controller: _nc,
                decoration: InputDecoration(
                  labelText: 'Houston Animal Shelter',
                  labelStyle: TextStyle(
                    color: Color(0xFF6200EE),
                  ),
                  suffixIcon: Icon(
                    Icons.check_circle,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF6200EE)),
                  ),
                ),
              ),
              SizedBox(height: 40),
              Text(
                "Description:",
                style: TextStyle(
                  fontFamily: "Geometria",
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
              TextField(
                controller: _dc,
                decoration: InputDecoration(
                  labelText: 'Help dogs find a beautiful home',
                  labelStyle: TextStyle(
                    color: Color(0xFF6200EE),
                  ),
                  suffixIcon: Icon(
                    Icons.check_circle,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF6200EE)),
                  ),
                ),
              ),
              SizedBox(height: 25),
              TextButton(
                child: Text("Add Your Organization",
                    style: TextStyle(
                        fontFamily: "Geometria",
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: Colors.white)),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                    return ColorPalette.purple150;
                  }),
                ),
                onPressed: () async {
                  var firebase = FirebaseFirestore.instance;
                  User? user = FirebaseAuth.instance.currentUser;
                  firebase.collection('organizations').add({
                    "name": _nc.text,
                    "description": _dc.text,
                    "owner": "${user?.uid ?? ''}",
                    "opportunities": []
                  });
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
