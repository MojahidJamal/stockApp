import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class itemDetails extends StatefulWidget {
  itemDetails({required this.index, Key? key}) : super(key: key);
  int index;
  @override
  State<itemDetails> createState() => _itemDetailsState();
}

class _itemDetailsState extends State<itemDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
            future: getItemDetails(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
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
                                Text('Item is not available')
                              ],
                            ),
                          )
                        : Column(
                            children: [
                              Text(
                                snapshot.data[widget.index]['itemName'],
                              ),
                            ],
                          )
                    : Text('');
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }),
      ),
    );
  }

  getItemDetails() async {
    QueryBuilder queryBuilder = QueryBuilder<ParseObject>(ParseObject('Items'));
    var response = await queryBuilder.query();

    return response.result;
  }
}
