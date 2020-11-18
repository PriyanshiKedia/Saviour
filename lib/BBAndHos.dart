import 'package:flutter/material.dart';
import 'package:frontend_app/Customer/LoginPage.dart';
import 'package:frontend_app/Hospital/hshow.dart';
import 'file:///C:/saviour/frontend_app/lib/BloodBank/databaseshow.dart';

import 'WelcomeProv.dart';

class BBAndHos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CONTENT PAGE'),
        centerTitle: true,
        backgroundColor: Colors.red[600],
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Databseshow()),
                );
              },
              child: Container(
                padding: EdgeInsets.all(75.0),
                margin: EdgeInsets.all(50.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(begin: Alignment.topCenter, colors: [
                    Colors.red[500],
                    Colors.red[300],
                    Colors.red[400]
                  ]),
                ),
                child: Text(
                  'BLOODBANK',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Hshow()),
                );
              },
              child: Container(
                padding: EdgeInsets.all(80.0),
                margin: EdgeInsets.all(50.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(begin: Alignment.topCenter, colors: [
                    Colors.red[500],
                    Colors.red[300],
                    Colors.red[400]
                  ]),
                ),
                child: Text(
                  'HOSPITAL',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
