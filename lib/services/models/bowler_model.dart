class BowlerDetails {
  final int? id;
  final String name;
  final int age;
  final String type;
  final String style;
  final String date;

  BowlerDetails({
    this.id,
    required this.name,
    required this.age,
    required this.type,
    required this.style,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'type': type,
      'style': style,
      'created_at': date,
    };
  }

  factory BowlerDetails.fromMap(Map<String, dynamic> map) {
    return BowlerDetails(
      id: map['id'] ?? 0,
      name: map['name'] ?? "",
      age: map['age'] != null ? map['age'] is int ? map['age'] : int.parse(map['age'].toString()) : 0,
      type: map['type'] ?? "",
      style: map['style'] ?? "",
      date: map['created_at'] ?? '',
    );
  }
}
