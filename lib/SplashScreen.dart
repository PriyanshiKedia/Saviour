import 'dart:async';
import 'package:flutter/material.dart';
import 'main.dart';

void main() {
  runApp(
      MaterialApp(
        home: SplashScreen(),
      )
  );
}

class SplashScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen>{

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    loadData();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
        image:DecorationImage(
          image:AssetImage('assets/images/home.jpg'),
        ),
      ),
    );
  }

  Future<Timer> loadData() async {
    return new Timer(Duration(seconds:2),onDoneLoading);
}

onDoneLoading() async{
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>MyApp()));
}
}