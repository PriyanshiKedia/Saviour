import 'package:flutter/material.dart';

import '../network_handler.dart';

class Databseshow extends StatefulWidget {
  @override
  _DatabseshowState createState() => _DatabseshowState();
}

class _DatabseshowState extends State<Databseshow> {
  var response;
  List users = [];
  NetworkHandler networkHandler = NetworkHandler();

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    response = await networkHandler.get('/bloodbank/getBloodbank');
    response = response['data'];
    print(response);
    setState(() {
      users = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('BLOOD BANK'),
        centerTitle: true,
        backgroundColor: Colors.red[600],
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              SizedBox(
                height: 15,
              ),
              Card(
                elevation: 5,
                child: Container(
                  width: width,
                  height: 60,
                  color: Colors.red,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        users[index]['name'].toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        users[index]['type'],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        users[index]['amount'].toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
