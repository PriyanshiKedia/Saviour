import 'package:flutter/material.dart';
import 'package:frontend_app/WelcomeProv.dart';

import '../network_handler.dart';

class InputWrapper extends StatefulWidget {
  @override
  _InputWrapperState createState() => _InputWrapperState();
}

class _InputWrapperState extends State<InputWrapper> {
  TextEditingController name = new TextEditingController();
  TextEditingController bloodType = new TextEditingController();
  TextEditingController amount = new TextEditingController();

  bool circular = false;
  bool validate = true;
  NetworkHandler networkHandler = NetworkHandler();

  fillForm() async {
    if (validate) {
      Map<String, String> data = {
        "name": name.text,
        "type": bloodType.text,
        "amount": amount.text
      };
      await networkHandler.post("/bloodbank/register", data);
      setState(() {
        circular = false;
      });
    } else {
      setState(() {
        circular = false;
      });
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
              height: 5,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: Colors.grey[200]))),
                    child: TextField(
                      controller: name,
                      decoration: InputDecoration(
                          hintText: "Blood Bank name",
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
                      controller: bloodType,
                      decoration: InputDecoration(
                          hintText: "Blood Type",
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
                      controller: amount,
                      decoration: InputDecoration(
                          hintText: "Blood amount",
                          hintStyle: TextStyle(color: Colors.grey),
                          border: InputBorder.none),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "",
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () async {
                setState(() {
                  circular = true;
                });
                await fillForm();
                if (circular == false && validate == true) {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WelcomeProv(),
                      ),
                      (route) => false);
                }
              },
              child: Container(
                height: 50,
                margin: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.red[500],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: circular
                    ? CircularProgressIndicator
                    : Center(
                        child: Text(
                          "UPDATE",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
