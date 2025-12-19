import 'package:flutter/material.dart';
import 'package:typeelevenkiosk/common/const/size.dart';
import 'package:typeelevenkiosk/common/extention/figma.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: CocorySize.width(2025),
      height: CocorySize.height(1029),
      decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(CocorySize.width(65))),
      child: Column(
        children: [
          Container(
            width: CocorySize.width(2025),
            height: CocorySize.height(459),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(CocorySize.width(65)),
                    topRight: Radius.circular(CocorySize.width(65))),
                gradient: LinearGradient(
                    stops: [0, 6/10, 1],
                    colors: [
                  Color(0xff6098F6),
                  Color(0xff004CCA),
                  Color(0xffD3E4FF)
                ])),
            child: Padding(
              padding: EdgeInsets.only(left: CocorySize.width(78)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: CocorySize.height(93)),
                  Text(
                    'If you have already booked,',
                    style: TextStyle(
                        letterSpacing: CocorySize.width(0),
                        height: CocorySize.width(120)
                            .toFigmaHeight(CocorySize.height(120)),
                        color: Colors.white,
                        fontSize: CocorySize.width(120),
                        fontStyle: FontStyle.italic),
                  ),
                  SizedBox(height: CocorySize.height(55)),
                  Text(
                    '如果是预约客户，',
                    style: TextStyle(
                        letterSpacing: CocorySize.width(0),
                        height: CocorySize.width(80)
                            .toFigmaHeight(CocorySize.height(94)),
                        color: Colors.white,
                        fontSize: CocorySize.width(80)),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: CocorySize.width(2025),
            height: CocorySize.height(1029-459),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(CocorySize.width(65)),
                    bottomRight: Radius.circular(CocorySize.width(65))),
                color: Colors.white),
            child: Padding(
              padding: EdgeInsets.only(left: CocorySize.width(78)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: CocorySize.height(111)),
                  Text(
                    'please fill out the pre-survey form at the bottom of\nthis screen while waiting in lounge.',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: CocorySize.width(75),
                    ),
                  ),
                  SizedBox(height: CocorySize.height(48)),
                  Text(
                    '请在休息室等待时填写此屏幕底部的预先问卷。',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: CocorySize.width(70)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
