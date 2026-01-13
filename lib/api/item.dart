class Item {
  final String time;
  final String name;
  final int count;
  final String room;

  Item({
    required this.time,
    required this.name,
    required this.count,
    required this.room,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      time: json['time'] ?? '',
      name: json['name'] ?? '',
      count: int.tryParse(json['count']?.toString() ?? '') ?? 1,
      room: json['room'] ?? '',
    );
  }
}
