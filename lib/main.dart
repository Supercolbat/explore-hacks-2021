import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:explore_hacks_2021/nav.dart';
import 'package:explore_hacks_2021/screens/home/home_screen.dart';
import 'package:explore_hacks_2021/screens/sign_in/sign_in_screen.dart';

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
          // return MaterialApp(
          //   home: Scaffold(
          //     bottomNavigationBar: Nav(),
          //   ),
          // );
          return SignInScreen();
        }

        return Container(color: Colors.green);
      },
    );
  }
}
