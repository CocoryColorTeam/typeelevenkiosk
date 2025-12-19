class Item {
  final String time;
  final String name;
  final int people;
  final String room;

  Item({
    required this.time,
    required this.name,
    required this.people,
    required this.room,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      time: json['time'] ?? '',
      name: json['name'] ?? '',
      people: json['people'] ?? 1,
      room: json['room'] ?? '',
    );
  }
}
