import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import 'constants/color_constants.dart';

class profilePage extends StatefulWidget {
  const profilePage({Key? key}) : super(key: key);

  @override
  State<profilePage> createState() => _profilePageState();
}

class _profilePageState extends State<profilePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: AnimatedTextKit(
          animatedTexts: [
            TypewriterAnimatedText(
              'COMING SOON',
              textStyle: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: kPrimaryColor,
              ),
              speed: Duration(milliseconds: 20),
            ),
          ],
          totalRepeatCount: 2,
          pause: Duration(milliseconds: 1000),
          displayFullTextOnTap: true,
          stopPauseOnTap: true,
        ),
        // child: Text(
        //   'INVENTORY SUMMARY',
        //   style: TextStyle(
        //     fontSize: 15,
        //     fontWeight: FontWeight.bold,
        //     color: Color(0xFFD6D6D6),
        //   ),
        // ),
      ),
    );
  }
}
