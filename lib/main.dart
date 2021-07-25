import 'package:explore_hacks_2021/screens/loading_screens/first_launch_screen.dart';
import 'package:explore_hacks_2021/screens/loading_screens/loading_screen.dart';
import 'package:explore_hacks_2021/screens/sign_in/sign_in_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:explore_hacks_2021/nav.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class _AppState extends State<App> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  Future<bool> isFirstLaunch() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var firstLaunch = prefs.getBool("first_launch");
    if (firstLaunch != null && !firstLaunch) {
      prefs.setBool("first_launch", true);
      return false;
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print(snapshot.error);
          return Container(
            color: Colors.red,
          );
        }

        if (snapshot.connectionState == ConnectionState.done) {
          // return Container(color: Colors.blue);
          isFirstLaunch().then((value) {
            return MaterialApp(
              home: Scaffold(
                body: value ? FirstLaunchScreen() : SignInScreen(),
              ),
            );
          });
          /*          
          return MaterialApp(home: Scaffold(body: SignInScreen()));
          return MaterialApp(
            home: Scaffold(
              bottomNavigationBar: Nav(),
            ),
          );
          */
        }

        return LoadingScreen();
      },
    );
  }
}
