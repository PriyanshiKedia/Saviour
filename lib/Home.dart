import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:frontend_app/Provider/BBHLogin.dart';
import 'package:frontend_app/Provider/BBHSignup.dart';
import 'package:frontend_app/Customer/LoginPage.dart';
import 'package:frontend_app/WelcomeProv.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget page = WelcomeProv();
  final storage = FlutterSecureStorage();
  bool toggle = false;

  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  void checkLogin() async {
    String token = await storage.read(key: "token");
    if (token != null) {
      setState(() {
        toggle = true;
      });
    } else {
      setState(() {
        toggle = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return toggle
        ? page
        : Scaffold(
            appBar: AppBar(
              title: Text('HOME PAGE'),
              centerTitle: true,
              backgroundColor: Colors.red[600],
            ),
            body: Center(
              child: Column(
                children: <Widget>[
                  InkWell(
                      child: Container(
                        padding: EdgeInsets.all(80.0),
                        margin: EdgeInsets.all(50.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              colors: [
                                Colors.red[500],
                                Colors.red[300],
                                Colors.red[400]
                              ]),
                        ),
                        child: Text(
                          'CUSTOMER',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      }),
                  InkWell(
                      child: Container(
                        padding: EdgeInsets.all(80.0),
                        margin: EdgeInsets.all(50.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              colors: [
                                Colors.red[500],
                                Colors.red[300],
                                Colors.red[400]
                              ]),
                        ),
                        child: Text(
                          'PROVIDER',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => BBHLogin()),
                        );
                      }),
                ],
              ),
            ),
          );
  }
}
