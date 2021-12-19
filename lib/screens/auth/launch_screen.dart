import 'package:evemts/prefs/shared_pref_controller.dart';
import 'package:flutter/material.dart';
class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  _LaunchScreenState createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      // String route = SharedPrefController().loggedIn ? '/OnBoarding': '/Sign_in';
      Navigator.pushReplacementNamed(context, '/on_boarding_screen');

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: const Color(0xff253975),
        child: const Padding(
          padding:  EdgeInsets.only(top: 340, left: 80, right: 80),
          child: Text(
            'Events',
            style: TextStyle(
              color: Colors.white,
              fontSize: 80,
              fontFamily: 'Pacifico',
            ),
          ),
        ),
      ),
    );
  }
}
