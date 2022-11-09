import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class QuantNum extends StatefulWidget {
  const QuantNum({Key? key}) : super(key: key);

  @override
  State<QuantNum> createState() => _QuantNumState();
}

class _QuantNumState extends State<QuantNum> {
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
                  ? Container(child: Text(snapshot.data.toString()))
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

    print('1234567891234567892345678');
    print(response.results);
    print('1234567891234567892345678');
    var i;
    var test = 0;
    for (i = 0; i < response.results?.length; i++) {
      test = test + int.parse(response.results![i]['itemQuantity']);
    }
    print('/////////////////////////');
    print(test);
    print('/////////////////////////');

    return test;
  }
}
