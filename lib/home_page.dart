import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class menuPage extends StatefulWidget {
  const menuPage({Key? key}) : super(key: key);

  @override
  State<menuPage> createState() => _menuPageState();
}

class _menuPageState extends State<menuPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(title: Center(child: Text('Home')),),
        body: SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Expanded(
                  child: Container(
                    alignment: Alignment.bottomLeft,
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Dashboard',
                        style: TextStyle(
                            fontSize: 40,
                            color: Color(0xFF262626),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: 50,
                color: Colors.grey.shade500,
                alignment: Alignment.centerLeft,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'INVENTORY SUMMARY',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFD6D6D6),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 150,
                        width: 150,
                        // color: Color(0xFF1ECEA),
                        child: Card(
                          elevation: 13,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(Icons.insert_drive_file_outlined),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text('9'),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text('Items'),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 150,
                        width: 150,
                        child: Card(
                          elevation: 13,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(Icons.folder),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text('0'),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text('Folders'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 150,
                        width: 150,
                        child: Card(
                          elevation: 13,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(Icons.inventory),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text('10'),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text('Quantity'),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 150,
                        width: 150,
                        child: Card(
                          elevation: 13,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(Icons.monetization_on_outlined),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text('9'),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text('Total Value'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 180,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
