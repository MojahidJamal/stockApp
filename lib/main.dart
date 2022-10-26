import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:stock/items_page.dart';
import 'package:stock/profile_page.dart';
import 'package:stock/search_page.dart';
import 'home_page.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final keyApplicationId = 'oFpYdrFz6zP2dOMAHBQCFmhdZensQsjgfl03TUgx';
  final keyClientKey = 'RoAFOfs38guD2t4ZGI0f7dPtfR9TacFt9iZvSm4D';
  final keyParseServerUrl = 'https://parseapi.back4app.com';

  await Parse().initialize(keyApplicationId, keyParseServerUrl,
      clientKey: keyClientKey, autoSendSessionId: true);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData(scaffoldBackgroundColor: Color(0xF77747F)),
      home: homePage(
        currentIndex: 0,
      ),
    );
  }
}

class homePage extends StatefulWidget {
  homePage({required this.currentIndex, Key? key}) : super(key: key);
  int currentIndex;

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  //int _currentIndex = 0;

  final tabs = [
    menuPage(),
    itemsPage(),
    searchPage(),
    profilePage(),
  ];

  // Recive q1 = Recive(q: 'moj', p: ['jma']);
  @override
  Widget build(BuildContext context) {
    Widget expa = Scaffold(
      body: tabs[widget.currentIndex],
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: widget.currentIndex,
        onTap: (i) => setState(() => widget.currentIndex = i),
        items: [
          /// Home
          SalomonBottomBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
            selectedColor: Colors.purple,
          ),

          /// Items
          SalomonBottomBarItem(
            icon: Icon(Icons.view_list_rounded),
            title: Text("Items"),
            selectedColor: Colors.pink,
          ),

          /// Search
          SalomonBottomBarItem(
            icon: Icon(Icons.search),
            title: Text("Search"),
            selectedColor: Colors.orange,
          ),

          /// Profile
          SalomonBottomBarItem(
            icon: Icon(Icons.person),
            title: Text("Profile"),
            selectedColor: Colors.teal,
          ),
        ],
      ),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: expa,
      builder: EasyLoading.init(),
      // localizationsDelegates: context.localizationDelegates,
      // supportedLocales: context.supportedLocales,
      //locale: context.locale,
    );
  }
}
