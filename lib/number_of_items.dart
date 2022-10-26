import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class ItemsNum extends StatefulWidget {
  const ItemsNum({Key? key}) : super(key: key);

  @override
  State<ItemsNum> createState() => _ItemsNumState();
}

class _ItemsNumState extends State<ItemsNum> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: getItems(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return snapshot.connectionState != ConnectionState.done
              ? Container(
                  width: 10,
                  height: 10,
                )
              : snapshot.data != null
                  ? Container(child: Text(snapshot.data.length.toString()))
                  : Center(
                      child: Container(
                      child: Text('0'),
                    ));
        },
      ),
    );
  }

  getItems() async {
    QueryBuilder queryBuilder = QueryBuilder<ParseObject>(ParseObject('Items'));
    //..whereEqualTo('country', widget.country)

    var response = await queryBuilder.query();

    return response.result;
  }
}
