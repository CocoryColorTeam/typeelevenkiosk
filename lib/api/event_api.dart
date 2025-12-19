import 'dart:async';
import 'package:intl/intl.dart';
import 'dio.dart';
import 'item.dart';


Stream<List<Item>> eventStream() async* {
  final today = DateFormat('yyyy-MM-dd').format(DateTime.now());
  const branchName = 'hongdae';
  while (true) {
    try {
      print('[EVENT STREAM] 요청 날짜: $today / 지점: $branchName');

      final response = await dio.get(
        '/events',
        queryParameters: {
          'date': today,
          'branchName': branchName
        },
      );

      if (response.statusCode == 200 &&
          (response.data['success'] == true || response.data['status'] == 'success')) {
        final List<dynamic> list = response.data['data'] ?? [];
        final events = list.map((e) => Item.fromJson(e)).toList();
        yield events;
      } else {
        print('[EVENT STREAM] 잘못된 응답: ${response.data}');
        yield [];
      }
    } catch (e) {
      print('[EVENT STREAM] 오류: $e');
      yield [];
    }

    await Future.delayed(const Duration(minutes: 30));
  }
}
