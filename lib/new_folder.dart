import 'package:flutter/material.dart';

class newFloder extends StatefulWidget {
  const newFloder({Key? key}) : super(key: key);

  @override
  State<newFloder> createState() => _newFloderState();
}

class _newFloderState extends State<newFloder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Center(
            child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Text('Cancel'))),
        actions: [
          Center(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: InkWell(
                child: Text('save'),
                onTap: () {
                  //TODO:
                },
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: const [
                Padding(
                  padding: EdgeInsets.all(18.0),
                  child: Text('Name'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
