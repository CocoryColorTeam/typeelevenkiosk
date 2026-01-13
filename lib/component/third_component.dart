import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import '../api/event_api.dart'; // ✅ eventStream() import
import '../api/item.dart';
import '../common/const/format.dart'; // ✅ Item model
import '../common/const/size.dart';
import 'change_now.dart';

class ThirdComponent extends StatefulWidget {
  const ThirdComponent({Key? key}) : super(key: key);

  @override
  State<ThirdComponent> createState() => _ThirdComponentState();
}

class _ThirdComponentState extends State<ThirdComponent> {
  Timer? _timer;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder<List<Item>>(
        stream: eventStream(), // ✅ Firebase → Dio 기반 Stream 변경
        builder: (context, snapshot) {
          if (snapshot.hasData && !snapshot.hasError) {
            final List<Item> eventMap = snapshot.data!;
            eventMap.sort((a, b) => a.time.compareTo(b.time));

            List<Item> event3 = [];

            // ✅ 현재 시간 ±1시간 이내 필터링
            var now = DateTime.now();
            for (var event in eventMap) {
              DateTime parsedTime = DateFormat('H:mm').parse(event.time, true);
              DateTime eventTime = DateTime(
                now.year,
                now.month,
                now.day,
                parsedTime.hour,
                parsedTime.minute,
              );
              if (eventTime.isAfter(now.subtract(const Duration(hours: 1))) &&
                  eventTime.isBefore(now.add(const Duration(hours: 1)))) {
                event3.add(event);
              }
            }

            return Container(
              width: CocorySize.width(2025),
              height: CocorySize.height(999),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(CocorySize.width(65)),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  top: CocorySize.height(28),
                  bottom: CocorySize.height(15),
                  left: CocorySize.width(40),
                  right: CocorySize.width(40),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: CocorySize.height(195),
                      child: Center(
                        child: Text(
                          'Please check your room number',
                          style: TextStyle(
                            fontSize: CocorySize.width(80),
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: CocorySize.height(24)),

                    // ✅ 현재 ±1시간 이내 고객
                    ChangeNowComponent(nowList: event3),

                    SizedBox(height: CocorySize.height(20)),

                    // ✅ 전체 예약 목록 표시
                    Expanded(
                      child: ListView.separated(
                        separatorBuilder: (context, index) =>
                            SizedBox(height: CocorySize.height(22.5)),
                        scrollDirection: Axis.vertical,
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: eventMap.length,
                        itemBuilder: (context, index) {
                          final e = eventMap[index];
                          return Padding(
                            padding: EdgeInsets.only(
                              left: CocorySize.width(100),
                              right: CocorySize.width(80),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // 시간
                                Text(
                                  e.time,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: CocorySize.width(60),
                                  ),
                                ),
                                // 이름
                                SizedBox(
                                  width: CocorySize.width(660),
                                  child: Text(
                                    e.name,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: CocorySize.width(60),
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                // 인원
                                SizedBox(
                                  width: CocorySize.width(270),
                                  child: Center(
                                    child: Text(
                                      '${e.count} ${e.count == 1 ? 'person' : 'people'}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: CocorySize.width(60),
                                      ),
                                    ),
                                  ),
                                ),
                                // 룸
                                SizedBox(
                                  width: CocorySize.width(560),
                                  child: Text(
                                    e.room,
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: CocorySize.width(60),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
