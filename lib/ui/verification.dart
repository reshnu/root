import 'package:flutter/material.dart';
import 'package:flutterapp/Animation/FadeAnimation.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:firebase_auth/firebase_auth.dart';

bool check = true;

class VerificationPage extends StatelessWidget {
  final userid;
  VerificationPage({this.userid});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: check,
        child: Column(
          children: [
            SafeArea(
              child: Container(
                height: 30.0,
                width: double.infinity,
                color: Colors.blue,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Verify Your Email Address',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 20.0,
                          decoration: TextDecoration.none),
                    ),
                  ],
                ),
              ),
            ),
            filmfoxlogo(),
          ],
        ),
      ),
    );
  }
}

Widget filmfoxlogo() {
  return Container(
    child: Column(
      children: <Widget>[
        FadeAnimation(
            1.3,
            Padding(
              padding: EdgeInsets.all(25),
              child: Image.asset(
                'assets/foxfilmlogo.png',
                height: 60,
                fit: BoxFit.fill,
              ),
            )),
      ],
    ),
  );
}
