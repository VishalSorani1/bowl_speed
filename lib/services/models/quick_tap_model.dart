class QuickTapModel {
  final String bowler;
  final double distance;
  final String time;
  final double kmh;
  final double mps;
  final String measurementType;
  final String date;

  QuickTapModel( {
    required this.bowler,
    required this.distance,
    required this.time,
    required this.kmh,
    required this.mps,
    required this.measurementType,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      'bowler': bowler,
      'distance': distance,
      'time': time,
      'mps': mps,
      'kmh': kmh,
      'measurementType': measurementType,
      'date': date,
    };
  }

  factory QuickTapModel.fromMap(Map<String, dynamic> map) {
    return QuickTapModel(
      bowler: map['bowler'] ?? "",
      distance: map['distance']?.toDouble() ?? 0.0,
      time: map['time'] ?? "00:00:00",
      mps: map['mps']?.toDouble() ?? 0.0,
      kmh: map['kmh']?.toDouble() ?? 0.0,
      measurementType: map['measurementType'] ?? '',
      date: map['date'] ?? '',
    );
  }
}
