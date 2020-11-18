import 'package:flutter/material.dart';
import '../network_handler.dart';

class Hshow extends StatefulWidget {
  @override
  _HshowState createState() => _HshowState();
}

class _HshowState extends State<Hshow> {
  var response;
  List users = [];
  NetworkHandler networkHandler = NetworkHandler();

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    response = await networkHandler.get('/hospital/getHospital');
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
        title: Text('HOSPITAL'),
        centerTitle: true,
        backgroundColor: Colors.red[600],
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              SizedBox(
                height: 10,
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
                        users[index]['bed'],
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
