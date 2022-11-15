import 'dart:ffi';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:stock/items/itemDetails.dart';

import 'package:stock/new_folder.dart';
import 'package:stock/items/new_item.dart';

import 'package:stock/constants/color_constants.dart';

class itemsPage extends StatefulWidget {
  itemsPage({Key? key}) : super(key: key);

  @override
  State<itemsPage> createState() => _itemsPageState();
}

class _itemsPageState extends State<itemsPage> {
  @override
  Widget build(BuildContext context) {
    print('vvvvvvvvvvvv');
    //print(Menu().count.toString());
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: FutureBuilder(
            future: getItemcheck(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return snapshot.data != null
                    ? snapshot.data.isEmpty
                        ? Center(
                            child: Column(
                              children: const [
                                Icon(
                                  Icons.error,
                                  color: Colors.red,
                                ),
                                Text('no items in your cart')
                              ],
                            ),
                          )
                        : ListView.builder(
                            padding: const EdgeInsets.all(8),
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, index) {
                              // return Card(
                              //   child: ListTile(
                              //     title: Text(snapshot.data[0]['itemName']),
                              //     subtitle: Text(snapshot.data[0]['itemName']),
                              //     trailing: IconButton(
                              //       icon: Icon(Icons.delete),
                              //       onPressed: () {
                              //         Menu().remove(Menu().basketItems[index]);
                              //       },
                              //     ),
                              //   ),
                              // );

                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              print(
                                                  'nooooooooqqq/////////////');
                                              print(snapshot.data[index]);
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      itemDetails(
                                                    index: snapshot.data[index],
                                                    // index: index
                                                  ),
                                                ),
                                              );
                                            },
                                            child: Row(
                                              children: [
                                                Container(
                                                  // color: Colors.grey[200],
                                                  width: 100,
                                                  height: 100,
                                                  child: snapshot.data[index]
                                                              ['itmeImage'] !=
                                                          null
                                                      ? CachedNetworkImage(
                                                          imageUrl: snapshot
                                                                          .data[
                                                                      index]
                                                                  ['itmeImage']
                                                              ['url'])
                                                      : const Icon(
                                                          Icons.image,
                                                        ),
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Container(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: Text(
                                                          snapshot.data[index]
                                                              ['itemName'],
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Container(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: Text(
                                                          snapshot.data[index]
                                                              ['itemSize'],
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text('Quantity:   '),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 8.0),
                                                            child: Container(
                                                              alignment: Alignment
                                                                  .centerLeft,
                                                              child: Text(snapshot
                                                                          .data[
                                                                      index][
                                                                  'itemQuantity']),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 8.0),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          Text(
                                                              'Price:         '),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Container(
                                                              alignment: Alignment
                                                                  .centerLeft,
                                                              child: Text(snapshot
                                                                          .data[
                                                                      index][
                                                                  'itemPrice']),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Divider(
                                      thickness: 3,
                                    ),
                                  ],
                                ),
                              );
                            })
                    : Text('');
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        backgroundColor: kPrimaryColor,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => Wrap(children: [
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text('Add New Item'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => newItem(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_album),
                title: Text('Add New Folder'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const newFloder(),
                    ),
                  );
                },
              ),
            ]),
          );

          // showModalBottomSheet<void>(
          //   context: context,
          //   builder: (BuildContext context) {
          //     return Container(
          //       height: 200,
          //       child: Column(
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         mainAxisSize: MainAxisSize.min,
          //         children: <Widget>[
          //           ElevatedButton(
          //               child: const Text('Add New Item'),
          //               onPressed: () {
          //                 Navigator.push(
          //                   context,
          //                   MaterialPageRoute(
          //                     builder: (context) => const newItem(),
          //                   ),
          //                 );
          //               }),
          //           ElevatedButton(
          //               child: const Text('Add New Floder'),
          //               onPressed: () {
          //                 Navigator.push(
          //                   context,
          //                   MaterialPageRoute(
          //                     builder: (context) => const newFloder(),
          //                   ),
          //                 );
          //               }),
          //           ElevatedButton(
          //             child: const Text('Cancel'),
          //             onPressed: () => Navigator.pop(context),
          //           ),
          //         ],
          //       ),
          //     );
          //   },
          // );
        },
      ),
    );
  }

  Future getItemcheck() async {
    QueryBuilder queryBuilder = QueryBuilder<ParseObject>(ParseObject('Items'));

    var response = await queryBuilder.query();

    return response.result;
  }
}
