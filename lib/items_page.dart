import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:stock/itemDetails.dart';
import 'package:stock/menu.dart';
import 'package:stock/new_folder.dart';
import 'package:stock/new_item.dart';
import 'package:image_picker/image_picker.dart';

import 'test.dart';
import 'package:stock/menu.dart';

class itemsPage extends StatefulWidget {
  // itemsPage({Key? key, this.name, this.size, this.quantity, this.price})
  //     : super(key: key);
  itemsPage({Key? key, this.name, this.size, this.price, this.quantity})
      : super(key: key);
  late dynamic? name;
  late dynamic? size;
  late dynamic? quantity;
  late dynamic? price;

  @override
  State<itemsPage> createState() => _itemsPageState();
}

class _itemsPageState extends State<itemsPage> {
  List<String> entries = <String>[
    'https://media.istockphoto.com/photos/mountain-landscape-picture-id517188688?k=20&m=517188688&s=612x612&w=0&h=i38qBm2P-6V4vZVEaMy_TaTEaoCMkYhvLCysE7yJQ5Q=',
    'https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8aHVtYW58ZW58MHx8MHx8&w=1000&q=80'
  ];

  late List<String> names = [widget.name!];
  late List<String> sizes = [widget.size!];
  late List<String> amounts = [widget.quantity!];
  late List<String> prices = [widget.price!];

  // List<String> test = [];

  // List<Test> test = [
  //   Test(size: 's', name: 's', quantity: 'ww', price: 'z'),
  //   // size: widget.size,
  //   // name: widget.name,
  //   // quantity: widget.quantity,
  //   // price: widget.price),
  // ];

  // List<String?> entries = <String>[
  //   'https://media.istockphoto.com/photos/mountain-landscape-picture-id517188688?k=20&m=517188688&s=612x612&w=0&h=i38qBm2P-6V4vZVEaMy_TaTEaoCMkYhvLCysE7yJQ5Q=',
  //   'https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8aHVtYW58ZW58MHx8MHx8&w=1000&q=80'
  // ];

  @override
  Widget build(BuildContext context) {
    print('vvvvvvvvvvvv');
    print(Menu().count.toString());
    return Scaffold(
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
                                    Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    itemDetails(index: index),
                                              ),
                                            );
                                          },
                                          child: Container(
                                            // color: Colors.grey[200],
                                            width: 100,
                                            height: 100,
                                            child: snapshot.data[index]
                                                        ['itmeImage'] !=
                                                    null
                                                ? CachedNetworkImage(
                                                    imageUrl: snapshot
                                                            .data[index]
                                                        ['itmeImage']['url'])
                                                : const Icon(
                                                    Icons.image,
                                                  ),
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Container(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  snapshot.data[index]
                                                      ['itemName'],
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Container(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  snapshot.data[index]
                                                      ['itemSize'],
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Container(
                                                alignment: Alignment.centerLeft,
                                                child: Text(snapshot.data[index]
                                                    ['itemQuantity']),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Container(
                                                alignment: Alignment.centerLeft,
                                                child: Text(snapshot.data[index]
                                                    ['itemPrice']),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
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
        onPressed: () {
          /// test this comment , this is copy from roda screen edit insurance ///

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
