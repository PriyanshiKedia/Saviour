import 'package:flutter/material.dart';
import 'HospitalHeader.dart';
import 'HospitalInputWrapper.dart';

class HospitalForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topCenter, colors: [
            Colors.red[500],
            Colors.red[300],
            Colors.red[400]
          ]),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(height: 50,),
            Header(),
            Expanded(child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                  )
              ),
              child: InputWrapper(),
            ))
          ],
        ),
      ),
    );
  }
}