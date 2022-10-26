import 'dart:io';

import 'dart:io' as plat;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

// import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import 'package:image_picker/image_picker.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:path_provider/path_provider.dart';
import 'package:stock/items_page.dart';
import 'package:stock/menu.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:stock/send_function.dart';
import 'package:stock/test.dart';
import 'main.dart';
import 'text_form.dart';
import 'send_function.dart';

class newItem extends StatefulWidget {
  newItem({Key? key}) : super(key: key);

  // TextEditingController nameController = TextEditingController();
  // TextEditingController sizeController = TextEditingController();
  // TextEditingController quantityController = TextEditingController();
  // TextEditingController priceController = TextEditingController();

  @override
  State<newItem> createState() => _newItemState();
}

class _newItemState extends State<newItem> {
  // get nameController => null;
  //
  // get sizeController => null;
  //
  // get quantityController => null;
  //
  // get priceController => null;
  TextEditingController nameController = TextEditingController();
  TextEditingController sizeController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  Test mj = Test();

  // final picker = ImagePicker();
  File? image;

  Future getImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;

    final imageTemporary = File(image.path);
    setState(() {
      this.image = imageTemporary;
    });
  }

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
                  EasyLoading.show(
                    status: 'Loading...',
                    maskType: EasyLoadingMaskType.clear,
                  );

                  _sendDataToSecondScreen();
                },
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    getImage();
                  },
                  child: Container(
                    color: Colors.grey[200],
                    width: 100,
                    height: 100,
                    child: image != null
                        ? Image.file(image!)
                        : Container(
                            width: 100,
                            height: 100,
                            child: Icon(Icons.add_a_photo_rounded)),
                  ),
                ),
                textFormWidget(controller: nameController, labelText: 'Name'),
                textFormWidget(
                  controller: sizeController,
                  labelText: 'Size',
                ),
                textFormWidget(
                  controller: quantityController,
                  labelText: 'Quantty',
                ),
                textFormWidget(
                  controller: priceController,
                  labelText: 'Price',
                ),
                RaisedButton(
                    child: Text('Save'),
                    onPressed: () {
                      EasyLoading.show(
                        status: 'Loading...',
                        maskType: EasyLoadingMaskType.clear,
                      );

                      _sendDataToSecondScreen();

                      //_sendDataToSecondScreen(context);
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }

  _sendDataToSecondScreen() async {
    print("1111111111111");
    File image2 = await getImageFileFromAssets();
    ParseFileBase fileBase2 = ParseFile(image2);
    print("2222222222222");

    var car = ParseObject('Items')
      ..set('itemName', nameController.text ?? "")
      ..set('itemSize', sizeController.text ?? "")
      ..set('itemQuantity', quantityController.text ?? "")
      ..set('itemPrice', priceController.text ?? "")
      ..set('itmeImage', image != null ? ParseFile(image) : fileBase2);

    var carResponse = await car.save();

    if (carResponse.success) {
      EasyLoading.showSuccess('Item Added');
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => homePage(
              currentIndex: 1,
            ),
          ));
    } else {
      EasyLoading.showError('Error, Try again');
    }
  }

  Future<File> getImageFileFromAssets() async {
    final byteData = await rootBundle.load('assets/images/logo.jpeg');

    final file = File('${(await getTemporaryDirectory()).path}/logo.jpeg');
    await file.writeAsBytes(byteData.buffer
        .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

    return file;
  }
}
