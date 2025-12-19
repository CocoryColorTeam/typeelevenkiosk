
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:typeelevenkiosk/common/const/size.dart';
import 'package:typeelevenkiosk/component/final_component.dart';
import 'package:typeelevenkiosk/component/first_component.dart';
import 'package:typeelevenkiosk/component/second_component.dart';
import 'package:typeelevenkiosk/component/third_component.dart';

import 'api/dio.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initDio();  // 필수
  runApp(ProviderScope(
      child: MaterialApp(
          theme: ThemeData(
              fontFamily: GoogleFonts.inter().fontFamily,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent),
          home: MyApp())));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late String today;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: ListView(
            children: [
              SizedBox(height: CocorySize.height(76)),
              Text(
                '欢迎光临COCORY色彩研究所。\nWELCOME TO COCORY COLOR INC.',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: CocorySize.width(90),
                    fontWeight: FontWeight.w700),
              ),
              Text(
                'Personal Color Analysis',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white, fontSize: CocorySize.width(80)),
              ),
              SizedBox(height: CocorySize.height(49)),
              FirstComponent(),
              SizedBox(height: CocorySize.height(55)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: CocorySize.width(68)),
                child: SecondComponent(),
              ),
              SizedBox(height: CocorySize.height(55)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: CocorySize.width(68)),
                child: ThirdComponent(),
              ),
              SizedBox(height: CocorySize.height(55)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: CocorySize.width(68)),
                child: FinalComponent(),
              ),
            ],
          ),
        );
      },
    );
  }
}
