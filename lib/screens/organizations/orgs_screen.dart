import 'package:explore_hacks_2021/constants/colors.dart';
import 'package:explore_hacks_2021/models/organization.dart';
import 'package:explore_hacks_2021/screens/organizations/org_screen.dart';
import 'package:explore_hacks_2021/screens/organizations/orgs_item.dart';
import 'package:explore_hacks_2021/screens/add_org/add_org_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OrganizationsScreen extends StatefulWidget {
  @override
  _OrganizationsScreenState createState() => _OrganizationsScreenState();
}

class _OrganizationsScreenState extends State<OrganizationsScreen> {
  int _pageIndx = 0;

  @override
  Widget build(BuildContext context) {
    Iterable<Future<dynamic>> back_to_the = [
      FirebaseFirestore.instance.collection('organizations').get(),
      FirebaseFirestore.instance.collection('opportunities').get()
    ];
    return FutureBuilder(
        future: Future.wait(back_to_the),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }
          String user = FirebaseAuth.instance.currentUser?.uid ?? '';
          QuerySnapshot orgs = (snapshot.data! as List<dynamic>).first;
          QuerySnapshot opps = (snapshot.data! as List<dynamic>).last;
          List<QueryDocumentSnapshot> orgs_list =
              orgs.docs.where((f) => f.get("owner") == user).toList();
          List<Organization> orgList = [];
          orgs_list.forEach((org) {
            Iterable<DocumentReference> opps_list =
                opps.docs.map((o) => o.get("organization"));
            var linked_opps_list = opps_list.where((o) => o.id == org.id);
            orgList.add(new Organization(
                owner: user,
                description: org.get("description").toString(),
                name: org.get("name").toString(),
                opportunities: org.get('opportunities')));
          });
          Size size = MediaQuery.of(context).size;
          final controller = PageController(
            initialPage: 0,
          );
          List<OrgScreen> pageWidgets = orgList.asMap().entries.map((e) {
            return OrgScreen(
                org: e.value,
                goBack: () {
                  controller.animateToPage(0,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeIn);
                });
          }).toList();

          void setPageIndex(int i) {
            setState(() {
              _pageIndx = i;
            });
          }

          final pageView = PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: controller,
            children: [
              Scaffold(
                floatingActionButton: Container(
                  margin: EdgeInsets.only(bottom: 10, right: 20),
                  width: 37,
                  height: 37,
                  child: FittedBox(
                      fit: BoxFit.cover,
                      child: FloatingActionButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => addOrgPage()),
                          );
                        },
                        backgroundColor: Colors.white,
                        child: SvgPicture.asset(
                          'assets/images/filled_plus_icon.svg',
                        ),
                      )),
                ),
                body: Container(
                  width: size.width,
                  color: ColorPalette.purple50,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: size.height * 0.08),
                        child: Column(
                          children: [
                            Text(
                              'Your Organizations',
                              style: TextStyle(
                                  fontFamily: "Geometria",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 25),
                            ),
                            SizedBox(height: 6),
                            Container(
                              width: size.width * 0.8,
                              child: Text(
                                'These are the organizations you manage! Thank you for making the world a better place',
                                style: TextStyle(
                                  fontFamily: "Geometria",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: ColorPalette.grey150,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 85),
                      Column(
                        children: orgList.asMap().entries.map((e) {
                          return Container(
                            margin: EdgeInsets.only(bottom: 20),
                            child: OrganizationItem(
                              org: e.value,
                              onPress: () {
                                setPageIndex(e.key);
                                controller.animateToPage(1,
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.easeIn);
                              },
                            ),
                          );
                        }).toList(),
                      )
                    ],
                  ),
                ),
              ),
              pageWidgets[_pageIndx]
            ],
          );

          return pageView;
        });
  }
}
