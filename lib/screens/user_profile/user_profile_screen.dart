import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:explore_hacks_2021/models/past_work.dart';
import 'package:explore_hacks_2021/screens/user_profile/past_works_list.dart';
import 'package:explore_hacks_2021/screens/user_profile/stat_box.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:explore_hacks_2021/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UserProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    User? user = FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance
        .collection('users/${user?.uid ?? ''}/pastOpp')
        .get()
        .then((snapshot) {
      int hours = 0;
      List<PastWork> pw = [];

      List<PastWork>.from(snapshot.docs).forEach((element) {});

      snapshot.docs.forEach((element) {
        dynamic data = element.data();

        pw.add(PastWork(
            date: data['date'],
            description: data['description'],
            hours: data['hours'],
            name: data['name'],
            organization: data['organization']));
      });

      print(hours);
    });
    return Scaffold(
      body: Container(
        width: size.width,
        color: ColorPalette.purple50,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: size.height * 0.07),
              height: size.height * 0.28,
              child: Stack(
                children: [
                  // pfp
                  Container(
                    width: size.width * 0.75,
                    height: size.height * 0.25,
                    decoration: BoxDecoration(
                        color: ColorPalette.purple150,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image:
                              AssetImage('assets/images/placeholder_pfp.png'),
                        )),
                  ),
                  // username card
                  Positioned(
                    bottom: 0,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 30),
                      width: 230,
                      height: 55,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(
                              color: ColorPalette.purple200.withOpacity(0.25),
                              blurRadius: 7,
                            )
                          ]),
                      child: Container(
                          margin: EdgeInsets.only(top: 6),
                          child: Column(
                            children: [
                              Text(
                                user?.displayName ?? '',
                                style: TextStyle(
                                  fontFamily: "Geometria",
                                  fontWeight: FontWeight.w500,
                                  color: ColorPalette.purple150,
                                  fontSize: 15,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 2),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Actively volunteering',
                                    style: TextStyle(
                                      fontFamily: "Geometria",
                                      fontWeight: FontWeight.w400,
                                      color: ColorPalette.grey150,
                                      fontSize: 11,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  SvgPicture.asset(
                                    'assets/images/green_check_icon.svg',
                                    width: 13,
                                  )
                                ],
                              ),
                            ],
                          )),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  StatBox(label: "Total Hours", stat: '20'),
                  StatBox(label: "Volunteered", stat: "2")
                ],
              ),
            ),
            SizedBox(height: 25),
            Expanded(
              child: PastWorksList(),
            )
          ],
        ),
      ),
    );
  }
}
