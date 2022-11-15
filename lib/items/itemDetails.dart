import 'dart:ffi';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:stock/constants/color_constants.dart';
import 'package:stock/main.dart';

class itemDetails extends StatefulWidget {
  dynamic index;
  itemDetails({required this.index, Key? key}) : super(key: key);

  @override
  State<itemDetails> createState() => _itemDetailsState();
}

class _itemDetailsState extends State<itemDetails> {
  int? counter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  height: 300,
                  child: CachedNetworkImage(
                    imageUrl: widget.index['itmeImage']['url'],
                    // snapshot.data[widget.index]
                    //     ['itmeImage']['url']
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  thickness: 3,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Product',
                        style: TextStyle(
                            fontSize: 25,
                            color: kPrimaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        widget.index['itemName'],
                        //snapshot.data[widget.index]['itemName'],
                        style: TextStyle(
                            fontSize: 25,
                            color: kPrimaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 3,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Size',
                        style: TextStyle(
                            fontSize: 25,
                            color: kPrimaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        widget.index['itemSize'],
                        //  snapshot.data[widget.index]['itemSize'],
                        style: TextStyle(
                            fontSize: 25,
                            color: kPrimaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 3,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Price',
                        style: TextStyle(
                            fontSize: 25,
                            color: kPrimaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        widget.index['itemPrice'],
                        // snapshot.data[widget.index]
                        //     ['itemPrice'],
                        style: TextStyle(
                            fontSize: 25,
                            color: kPrimaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 3,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Quantity',
                        style: TextStyle(
                            fontSize: 25,
                            color: kPrimaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                      // Text(
                      //   snapshot.data[widget.index]
                      //       ['itemQuantity'],
                      //   style: TextStyle(
                      //       fontSize: 30,
                      //       color: Color(0xFF262626),
                      //       fontWeight: FontWeight.bold),
                      // ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: kPrimaryColor),
                            child: Row(
                              children: [
                                InkWell(
                                    onTap: () {
                                      if (counter == null) {
                                        counter = int.parse(
                                            widget.index['itemQuantity']);
                                      }

                                      setState(() {
                                        counter = (counter! - 1);
                                      });
                                    },
                                    child: Icon(
                                      Icons.remove,
                                      color: Colors.white,
                                      size: 16,
                                    )),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 3),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 3, vertical: 2),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(3),
                                      color: Colors.white),
                                  child: counter == null
                                      ? Text(widget.index['itemQuantity'],
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16))
                                      : Text(
                                          counter.toString(),
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16),
                                        ),
                                ),
                                InkWell(
                                    onTap: () {
                                      if (counter == null) {
                                        counter = int.parse(
                                            widget.index['itemQuantity']);
                                      }

                                      setState(() {
                                        counter = (counter! + 1);
                                      });
                                    },
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 16,
                                    )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 3,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: kPrimaryColor),
                    onPressed: () async {
                      //
                      var test = ParseObject('Items')
                        ..objectId = widget.index['objectId']
                        ..set(
                            'itemQuantity',
                            counter == null
                                ? widget.index['itemQuantity']
                                : counter.toString());
                      print(test);
                      print('1234567890');

                      var response = await test.save();
                      if (response.success) {
                        EasyLoading.showSuccess('Done');
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (C) => homePage(
                                      currentIndex: 1,
                                    )),
                            (route) => false);
                      } else {
                        EasyLoading.showError('Error');
                      }
                    },
                    child: Text('Save'))
              ],
            ),
          ),
        ));
  }

  getItemDetails() async {
    QueryBuilder queryBuilder = QueryBuilder<ParseObject>(ParseObject('Items'));
    var response = await queryBuilder.query();

    return response.result;
  }
}
