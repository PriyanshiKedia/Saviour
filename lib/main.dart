import 'package:flutter/material.dart';
import 'package:frontend_app/BloodBank/BloodBankForm.dart';
import 'package:frontend_app/Hospital/HospitalForm.dart';
import 'package:frontend_app/Customer/LoginPage.dart';
import 'package:frontend_app/Customer/Signup.dart';
import 'package:frontend_app/WelcomeProv.dart';

import 'BBAndHos.dart';
import 'Provider/BBHLogin.dart';
import 'Provider/BBHSignup.dart';
import 'Home.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
