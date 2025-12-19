import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:typeelevenkiosk/common/const/size.dart';
import 'package:typeelevenkiosk/pageview/first_page.dart';
import 'package:typeelevenkiosk/pageview/second_page.dart';
import 'package:typeelevenkiosk/pageview/third_page.dart';

class FirstComponent extends StatefulWidget {
  const FirstComponent({super.key});

  @override
  State<FirstComponent> createState() => _FirstComponentState();
}

class _FirstComponentState extends State<FirstComponent> {
  late PageController _pageController;
  late Timer _timer;
  int _currentPage = 0;
  final int _totalPages = 2;
  final int _initialPage = 100000; // 큰 수로 초기화

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _initialPage);
    _currentPage = _initialPage;
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      _currentPage++;
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  int _getRealIndex(int position) {
    return position % _totalPages;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: CocorySize.height(1029),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(CocorySize.width(65)),
      ),
      child: PageView.builder(

        controller: _pageController,
        itemBuilder: (context, index) {
          final realIndex = _getRealIndex(index);
          switch (realIndex) {
            case 0:
              return FirstPage();
            case 1:
              return SecondPage();
            case 2:
              return ThirdPage();
            default:
              return Container(); // 예외 처리
          }
        },
      ),
    );
  }
}
