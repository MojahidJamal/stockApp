import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:anim_search_bar/anim_search_bar.dart';

import 'constants/color_constants.dart';

class searchPage extends StatefulWidget {
  const searchPage({Key? key}) : super(key: key);

  @override
  State<searchPage> createState() => _searchPageState();
}

class _searchPageState extends State<searchPage> {
  TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20.0, right: 10, left: 10),

          /// In AnimSearchBar widget, the width, textController, onSuffixTap are required properties.
          /// You have also control over the suffixIcon, prefixIcon, helpText and animationDurationInMilli
          child: AnimSearchBar(
            width: 400,
            textController: textController,
            onSuffixTap: () {
              setState(() {
                textController.clear();
              });
            },
          ),
        ),
        SizedBox(
          height: 200,
        ),
        Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
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
          ],
        ),
      ],
    );
  }
}
