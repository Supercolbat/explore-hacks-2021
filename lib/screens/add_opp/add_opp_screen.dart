import 'package:explore_hacks_2021/constants/colors.dart';
import 'package:explore_hacks_2021/screens/organizations/orgs_screen.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
  addOppScreenState createState() => addOppScreenState();
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
            List<DropdownMenuItem<String>> items = orgs
                .map((f) => new DropdownMenuItem(
                    child: Text(f.get("name").toString()),
                    value: f.get("name").toString()))
                .toList();
            Size size = MediaQuery.of(context).size;
            DateTime final_date;

            return Scaffold(
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
<<<<<<< HEAD
=======
                            /*
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => OrganizationsScreen()),
                            );
                            */
>>>>>>> 6285cc09c64802975f0568451175d7ebe6bf0130
                          },
                          child: SvgPicture.asset(
                            'assets/images/left-arrow.svg',
                            width: 50,
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      Text(
                        "Title:",
                        style: TextStyle(
                          fontFamily: "Geometria",
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Help Walk Dogs',
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
                      SizedBox(height: 40),
                      Text(
                        "Address:",
                        style: TextStyle(
                          fontFamily: "Geometria",
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Address text',
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
                        child: Text("Choose a date",
                           style: TextStyle(
                              fontFamily: "Geometria",
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              color: Colors.white
                           )
                      ),
                      style: ButtonStyle(
                           backgroundColor:
                                MaterialStateProperty.resolveWith<Color>(
                                    (Set<MaterialState> states) {
                              return ColorPalette.purple150;
                            }),

                      ),
                      onPressed: () async {
                      DatePicker.showDatePicker(context,
                              showTitleActions: true,
                              minTime: DateTime.now(),
                              onChanged: (date) {
                            print('change $date');
                          }, onConfirm: (date) {
                            print('confirm $date');
                            final_date = date;
                          }, currentTime: DateTime.now(), locale: LocaleType.en);
                      }
                      ),
                      TextButton(
                          child: Text("Add Your Listing",
                              style: TextStyle(
                                  fontFamily: "Geometria",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                  color: Colors.white)),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.resolveWith<Color>(
                                    (Set<MaterialState> states) {
                              return ColorPalette.purple150;
                            }),
                          ),
                          onPressed: () async {
                            Navigator.pop(context);
                          })
                    ],
                  ),
                ),
              ),
            );
          }
          return Center(
              child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(ColorPalette.purple150),
          ));
        });
  }
}
