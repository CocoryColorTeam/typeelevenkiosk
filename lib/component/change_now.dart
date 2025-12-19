import 'dart:async';
import 'package:flutter/material.dart';
import '../common/const/size.dart';

class ChangeNowComponent extends StatefulWidget {
  const ChangeNowComponent({Key? key, required this.nowList}) : super(key: key);
  final List nowList; // ✅ Item 리스트 (Item model 기반)

  @override
  State<ChangeNowComponent> createState() => _ChangeNowComponentState();
}

class _ChangeNowComponentState extends State<ChangeNowComponent> {
  int _currentIndex = 0;
  double _opacity = 1.0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    if (widget.nowList.isNotEmpty) {
      _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
        _changeName();
      });
    }
  }

  void _changeName() {
    if (widget.nowList.isEmpty) return;

    setState(() {
      _opacity = 0.0; // 페이드 아웃
    });

    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted && widget.nowList.isNotEmpty) {
        setState(() {
          _currentIndex = (_currentIndex + 1) % widget.nowList.length;
          _opacity = 1.0; // 페이드 인
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.nowList.isEmpty) {
      // 🔸 예약이 없을 때 회색 박스 표시
      return Container(
        width: CocorySize.width(1945),
        height: CocorySize.height(279),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xff575757), Color(0xff000000), Color(0xff666666)],
          ),
          borderRadius: BorderRadius.circular(CocorySize.width(110)),
        ),
      );
    }

    final current = widget.nowList[_currentIndex];

    return Container(
      width: CocorySize.width(1945),
      height: CocorySize.height(279),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xff575757), Color(0xff000000), Color(0xff666666)],
        ),
        borderRadius: BorderRadius.circular(CocorySize.width(110)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: CocorySize.width(114)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // ⏰ 시간
            AnimatedOpacity(
              opacity: _opacity,
              duration: const Duration(milliseconds: 500),
              child: Text(
                current.time,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: CocorySize.width(130),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),

            // 👤 이름 + 인원 + 룸
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                AnimatedOpacity(
                  opacity: _opacity,
                  duration: const Duration(milliseconds: 500),
                  child: Text(
                    current.name,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: CocorySize.width(70),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    AnimatedOpacity(
                      opacity: _opacity,
                      duration: const Duration(milliseconds: 500),
                      child: Text(
                        '${current.people} ${current.people == 1 ? 'person' : 'people'}',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: CocorySize.width(65),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(width: CocorySize.width(73)),
                    AnimatedOpacity(
                      opacity: _opacity,
                      duration: const Duration(milliseconds: 500),
                      child: Text(
                        current.room,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: CocorySize.width(65),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
