import 'package:flutter/material.dart';
import 'package:frontend_app/Provider/BBHLogin.dart';
import 'package:frontend_app/Provider/BBHSignup.dart';
import 'package:frontend_app/Customer/LoginPage.dart';
import '../WelcomeProv.dart';
import '../network_handler.dart';

class InputWrapper extends StatefulWidget {
  @override
  _InputWrapperState createState() => _InputWrapperState();
}

class _InputWrapperState extends State<InputWrapper> {
  TextEditingController organisation = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController address = new TextEditingController();
  TextEditingController code = new TextEditingController();

  NetworkHandler networkHandler = NetworkHandler();

  String errorText;
  bool validate = true;
  bool circular = false;

  signMeUp() async {
    if (validate) {
      Map<String, String> data = {
        "organisation": organisation.text,
        "password": password.text,
        "address": address.text,
        "code": code.text
      };
      await networkHandler.post("/providers/register", data);
      setState(() {
        circular = false;
      });
    } else {
      setState(() {
        circular = false;
      });
    }
  }

  checkUser() async {
    if (organisation.text.length == 0 ||
        password.text.length == 0 ||
        address.text.length == 0 ||
        code.text.length == 0) {
      setState(() {
        circular = false;
        validate = false;
        errorText = "Email cannot be empty";
      });
    } else {
      var response = await networkHandler
          .get("/providers/checkOrganisation/${organisation.text}");
      if (response["Status"]) {
        setState(() {
          circular = false;
          validate = false;
          errorText = "Organisation already exists";
        });
      } else {
        setState(() {
          circular = false;
          validate = true;
        });
      }
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
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(8),
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
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Colors.grey[200]))),
                      child: TextField(
                        controller: password,
                        decoration: InputDecoration(
                            hintText: "Enter your password",
                            hintStyle: TextStyle(color: Colors.grey),
                            border: InputBorder.none),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Colors.grey[200]))),
                      child: TextField(
                        controller: address,
                        decoration: InputDecoration(
                            hintText: "Address",
                            hintStyle: TextStyle(color: Colors.grey),
                            border: InputBorder.none),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Colors.grey[200]))),
                      child: TextField(
                          controller: code,
                          decoration: InputDecoration(
                              hintText: "HospitalCode",
                              hintStyle: TextStyle(color: Colors.grey),
                              border: InputBorder.none)),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            InkWell(
                child: Container(
                  child: Text(
                    " ",
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
              height: 10,
            ),
            InkWell(
                child: Container(
                  height: 50,
                  margin: EdgeInsets.symmetric(horizontal: 50),
                  decoration: BoxDecoration(
                    color: Colors.red[500],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: circular
                      ? CircularProgressIndicator()
                      : Center(
                          child: Text(
                            "SIGN UP",
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
                  await checkUser();
                  await signMeUp();
                  if (circular == false && validate == true) {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BBHLogin(),
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
