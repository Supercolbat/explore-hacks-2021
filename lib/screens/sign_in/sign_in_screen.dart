import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:explore_hacks_2021/auth.dart';
import 'package:explore_hacks_2021/nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:explore_hacks_2021/constants/colors.dart';
import 'package:explore_hacks_2021/screens/sign_in/facebook_btn.dart';
import 'package:explore_hacks_2021/screens/sign_in/google_btn.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    Future<void> addUser(User user) {
      return FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get()
          .then((snapshot) => {
                if (snapshot.exists)
                  {
                    //  FirebaseFirestore.instance.collection('users').add({
                    //   'email': user.email,
                    //   'name': user.displayName,
                    //   'ownedOrganizations': [],
                    //   'typePreference': '',
                    //   'upcomingOpportunities': []
                    // })
                  }
                else
                  {
                    FirebaseFirestore.instance
                        .collection('users')
                        .doc(user.uid)
                        .set({
                      'email': user.email,
                      'name': user.displayName,
                      'ownedOrganizations': [],
                      'typePreference': '',
                      'upcomingOpportunities': []
                    })
                  }
              });
    }

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Stack(
          children: [
            SvgPicture.asset(
              'assets/sign-in-top.svg',
              semanticsLabel: 'login-svg',
              width: size.width,
            ),
            Column(
              children: [
                Column(
                  children: [
                    // logo
                    Container(
                      height: 150,
                      margin: EdgeInsets.only(top: size.height * 0.5 - 170),
                      decoration: BoxDecoration(
                          color: ColorPalette.purple150,
                          shape: BoxShape.circle),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'App Name',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: Colors.black,
                          fontSize: 30),
                    )
                  ],
                ),
                SizedBox(height: size.height * 0.08),
                _isLoading
                    ? CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                            ColorPalette.purple150),
                      )
                    : Column(
                        children: [
                          GestureDetector(
                            onTap: () async {
                              setState(() {
                                _isLoading = true;
                              });

                              User? user = await AuthService.signInWithGoogle(
                                  context: context);

                              setState(() {
                                _isLoading = false;
                              });

                              if (user != null) {
                                await addUser(user);

                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => Nav()),
                                );
                              }
                            },
                            child: GoogleBtn(),
                          ),
                          SizedBox(height: 28),
                          FacebookBtn(),
                        ],
                      )
              ],
            )
          ],
        ),
      ),
    );
  }
}
