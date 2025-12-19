import 'package:flutter/material.dart';
import 'package:typeelevenkiosk/common/const/size.dart';
import 'package:typeelevenkiosk/common/extention/figma.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
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
            height: CocorySize.height(511),
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
                  SizedBox(height: CocorySize.height(98)),
                  Text(
                    'If you would like to make\na reservation or proceed today,',
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
                    '如果您想预约或今天就想做测色，',
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
            height: CocorySize.height(518),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(CocorySize.width(65)),
                    bottomRight: Radius.circular(CocorySize.width(65))),
                color: Colors.white),
            child: Padding(
              padding: EdgeInsets.only(left: CocorySize.width(78)),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: CocorySize.height(79)),
                      Text(
                        'please scan the QR code on the right\nto book, or ask our staff on the 3rd floor.',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: CocorySize.width(75),
                        ),
                      ),
                      SizedBox(height: CocorySize.height(48)),
                      Text(
                        '请扫描右侧的二维码进行预约，\n或向三楼的工作人员咨询。',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: CocorySize.width(60)),
                      ),
                    ],
                  ),
                  SizedBox(width: CocorySize.width(88)),
                  Container(
                    width: CocorySize.width(375.11),
                    height: CocorySize.height(416),
                    child: Image.asset('assets/png/reservation_qr.png',fit: BoxFit.fill,),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
