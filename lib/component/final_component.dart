import 'package:flutter/material.dart';
import 'package:typeelevenkiosk/common/const/size.dart';
import 'package:typeelevenkiosk/common/extention/figma.dart';

class FinalComponent extends StatefulWidget {
  const FinalComponent({super.key});

  @override
  State<FinalComponent> createState() => _FinalComponentState();
}

class _FinalComponentState extends State<FinalComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: CocorySize.width(2025),
      height: CocorySize.height(763),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(CocorySize.width(70))),
      child: Padding(
        padding: EdgeInsets.only(
            top: CocorySize.height(97),
            bottom: CocorySize.height(84.36),
            left: CocorySize.width(104),
            right: CocorySize.width(90.45)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pre-survey',
                  style: TextStyle(
                      fontSize: CocorySize.width(70),
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.italic),
                ),
                Text(
                  'for booked customers',
                  style: TextStyle(
                      fontSize: CocorySize.width(50),
                      fontStyle: FontStyle.italic),
                ),
                SizedBox(height: CocorySize.height(15)),
                Text('预约客户的预调查问卷',
                    style: TextStyle(fontSize: CocorySize.width(45))),
                SizedBox(height: CocorySize.height(72)),
                Text(
                  '如果是预约者，请在开始前填写预先问卷。\n我们将把结果发送到您提交的电子邮箱。\n\nThe results will be sent to the email address\nyou provided.',
                  style: TextStyle(
                      fontSize: CocorySize.width(30),
                      height: CocorySize.width(50)
                          .toFigmaHeight(CocorySize.width(30))),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    width: CocorySize.width(517.26),
                    height: CocorySize.height(573.64),
                    child: Image.asset(
                      'assets/png/korean_qr.png',
                      fit: BoxFit.fill,
                    )),
                SizedBox(width: CocorySize.width(70)),
                Container(
                    width: CocorySize.width(517.26),
                    height: CocorySize.height(573.64),
                    child: Image.asset(
                      'assets/png/english_qr.png',
                      fit: BoxFit.fill,
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
