import 'package:flutter/material.dart';
import 'package:frontend_app/Customer/LoginPage.dart';
import '../BBAndHos.dart';
import '../network_handler.dart';

class InputWrapper extends StatefulWidget {
  @override
  _InputWrapperState createState() => _InputWrapperState();
}

class _InputWrapperState extends State<InputWrapper> {
  TextEditingController username = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController phone = new TextEditingController();

  NetworkHandler networkHandler = NetworkHandler();

  String errorText;
  bool validate = true;
  bool circular = false;

  signMeUp() async {
    if (validate) {
      Map<String, String> data = {
        "username": username.text,
        "email": email.text,
        "password": password.text,
        "phone": phone.text
      };
      await networkHandler.post("/customers/register", data);
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
    if (username.text.length == 0 ||
        password.text.length == 0 ||
        email.text.length == 0 ||
        phone.text.length == 0) {
      setState(() {
        circular = false;
        validate = false;
        errorText = "Email cannot be empty";
      });
    } else {
      var response =
          await networkHandler.get("/customers/checkEmail/${email.text}");
      if (response["Status"]) {
        setState(() {
          circular = false;
          validate = false;
          errorText = "Email already exists";
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
        padding: EdgeInsets.all(30),
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
                        controller: username,
                        decoration: InputDecoration(
                            hintText: "Username",
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
                        controller: email,
                        decoration: InputDecoration(
                            hintText: "Enter your email",
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
                          controller: phone,
                          decoration: InputDecoration(
                              hintText: "Phone number",
                              hintStyle: TextStyle(color: Colors.grey),
                              border: InputBorder.none)),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "",
              style: TextStyle(color: Colors.grey),
            ),
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
                  child: Center(
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
                          builder: (context) => LoginPage(),
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
