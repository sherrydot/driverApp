import 'dart:async';

import 'package:driver_app/authentication/login_screen.dart';
import 'package:driver_app/authentication/signup_screen.dart';
import 'package:driver_app/global/global.dart';
import 'package:driver_app/mainScreens/main_screen.dart';
//import 'package:driver_app/mainScreens/main_screen.dart';
import 'package:flutter/material.dart';

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({Key? key}) : super(key: key);

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  startTimer() // timer for splash screen
  {
    Timer(const Duration(seconds: 3), () async {

      if (await firebaseAuth.currentUser != null){
        currentFirebaseUser = firebaseAuth.currentUser;
        Navigator.push(
          context,
          MaterialPageRoute(builder: (c) => MainScreen()),
        );
      }
      else{
      //send user to home screen
      Navigator.push(
        context,
        MaterialPageRoute(builder: (c) => loginScreen()),
      );
    };
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Color(0xffacf3df),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("images/logo_fg.png"),
              const SizedBox(
                height: 10,
              ),
              ],
          ),
        ),
      ),
    );
  }
}
