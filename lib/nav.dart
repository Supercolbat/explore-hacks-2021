import 'package:explore_hacks_2021/constants/colors.dart';
import 'package:explore_hacks_2021/screens/organizations/orgs_screen.dart';
import 'package:explore_hacks_2021/screens/user_profile/user_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:explore_hacks_2021/screens/home/home_screen.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

class Nav extends StatefulWidget {
  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    UserProfileScreen(),
    OrganizationsScreen()
  ];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        height: 50,
        width: size.width,
        margin: EdgeInsets.symmetric(horizontal: 25),
        child: GNav(
            backgroundColor: Colors.white,
            rippleColor: Colors.grey, // tab button ripple color when pressed
            hoverColor: Colors.grey, // tab button hover color
            haptic: true, // haptic feedback
            tabBorderRadius: 20,
            tabActiveBorder: Border.all(
                color: ColorPalette.purple200, width: 1), // tab button border
            tabBorder: Border.all(
                color: Colors.transparent, width: 1), // tab button border
            tabShadow: [], // tab button shadow
            curve: Curves.easeOutExpo, // tab animation curves
            duration: Duration(milliseconds: 400), // tab animation duration
            gap: 8, // the tab button gap between icon and text
            color: Colors.grey[800], // unselected icon color
            activeColor: ColorPalette.purple200, // selected icon and text color
            iconSize: 24, // tab button icon size

            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            selectedIndex: _selectedIndex,
            onTabChange: _onItemTap,
            tabs: [
              GButton(
                icon: LineIcons.globe,
                text: 'Home',
              ),
              GButton(
                icon: LineIcons.user,
                text: 'Profile',
              ),
              GButton(
                icon: LineIcons.map,
                text: 'Organizations',
              ),
            ]),
      ),
    );
  }
}
