import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:frontend_app/Provider/BBHSignup.dart';
import 'package:frontend_app/WelcomeProv.dart';
import '../network_handler.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class InputWrapper extends StatefulWidget {
  @override
  _InputWrapperState createState() => _InputWrapperState();
}

class _InputWrapperState extends State<InputWrapper> {
  TextEditingController organisation = new TextEditingController();
  TextEditingController password = new TextEditingController();
  NetworkHandler networkHandler = NetworkHandler();

  String errorText;
  bool validate = false;
  bool circular = false;
  final storage = new FlutterSecureStorage();

  logMeIn() async {
    Map<String, String> data = {
      "organisation": organisation.text,
      "password": password.text,
    };
    var response = await networkHandler.post("/providers/login", data);

    if (response.statusCode == 200 || response.statusCode == 201) {
      Map<String, dynamic> output = json.decode(response.body);
      storage.write(key: "token", value: output["token"]);
      print(output["token"]);
      setState(() {
        validate = true;
        circular = false;
      });
    } else {
      setState(() {
        validate = false;
        errorText = "Incorrect organisation/password combination";
        circular = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(40),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: Colors.grey[200]))),
                    child: TextField(
                      controller: organisation,
                      decoration: InputDecoration(
                          hintText: "Organisation name",
                          hintStyle: TextStyle(color: Colors.grey),
                          border: InputBorder.none),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: Colors.grey[200]))),
                    child: TextField(
                      controller: password,
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: "Enter your password",
                          hintStyle: TextStyle(color: Colors.grey),
                          border: InputBorder.none),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            InkWell(
                child: Container(
                  child: Text(
                    "Don't have account? SignUp ",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BBHSignup()),
                  );
                }),
            SizedBox(
              height: 25,
            ),
            InkWell(
                child: Container(
                  height: 50,
                  margin: EdgeInsets.symmetric(horizontal: 50),
                  decoration: BoxDecoration(
                    color: Colors.red[500],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: circular
                        ? CircularProgressIndicator
                        : Text(
                            "SIGN IN",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                  ),
                ),
                onTap: () async {
                  setState(() {
                    circular = true;
                  });
                  await logMeIn();
                  if (circular == false && validate == true) {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WelcomeProv(),
                        ),
                        (route) => false);
                  }
                }),
          ],
        ),
      ),
    );
  }
}
