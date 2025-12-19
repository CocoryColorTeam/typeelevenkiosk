import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:typeelevenkiosk/common/const/size.dart';
import 'package:typeelevenkiosk/common/extention/figma.dart';
import 'package:intl/intl.dart'; // 시간 비교를 위해 추가
import 'dart:async';

class ThirdPage extends StatefulWidget {
  const ThirdPage({super.key});

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _scheduleNextUpdate();
  }

  void _scheduleNextUpdate() {
    // 현재 시간과 다음 정각 또는 30분까지의 시간 계산
    var now = DateTime.now();
    var nextHalfHour = now.minute < 30
        ? DateTime(now.year, now.month, now.day, now.hour, 30)
        : DateTime(now.year, now.month, now.day, now.hour + 1, 0);
    var delay = nextHalfHour.difference(now);

    // 첫 갱신: 다음 정각 또는 30분이 될 때
    _timer = Timer(delay, () {
      setState(() {});
      // 이후 30분마다 갱신
      _timer = Timer.periodic(Duration(minutes: 30), (timer) {
        setState(() {});
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DatabaseEvent>(
      stream: FirebaseDatabase.instance.ref().child('events/available').onValue,
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data!.snapshot.value != null) {
          List<dynamic> data = [];
          if (snapshot.data!.snapshot.value is List) {
            data = snapshot.data!.snapshot.value as List<dynamic>;
          } else if (snapshot.data!.snapshot.value is Map) {
            data = (snapshot.data!.snapshot.value as Map<dynamic, dynamic>).values.toList();
          }

          // 현재 시간
          String currentTime = DateFormat('HH:mm').format(DateTime.now());

          // 필터링된 시간 리스트
          List availableTime = data.where((item) {
            if (item is Map) {
              String itemTime = item['time'];
              int itemCount = item['count'];

              // 현재 시간 가져오기
              String currentTime = DateFormat('HH:mm').format(DateTime.now());

              // count가 0인 경우나 현재 시간보다 이전 시간은 제외
              return itemCount > 0 && itemTime.compareTo(currentTime) > 0;
            }
            return false;
          }).toList();

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
                          'Today’s available time',
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
                          '오늘 진행 가능한 타임',
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
                  height: CocorySize.height(1029 - 459),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(CocorySize.width(65)),
                          bottomRight: Radius.circular(CocorySize.width(65))),
                      color: Colors.white),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: CocorySize.width(78),vertical: CocorySize.height(57)),
                    child: ListView.separated(
                      itemCount: availableTime.length,
                      separatorBuilder: (context, index) {
                        return SizedBox(height: CocorySize.height(22));
                      },
                      itemBuilder: (context, index) {
                        final availTime = availableTime[index];
                        return Row(
                          children: [
                            Text(
                              availTime['time'],
                              style: TextStyle(
                                  fontSize: CocorySize.width(70),
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: CocorySize.width(62)),
                            Expanded(child: Divider()),
                            SizedBox(width: CocorySize.width(62)),
                            Text(
                                'MAX ${availTime['count']} ${availTime['count'] == 1 ? 'person' : 'people'}',
                                style: TextStyle(fontSize: CocorySize.width(70)))
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
