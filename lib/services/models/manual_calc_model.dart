class ManualCalcModel {
  final double distance;
  final double time;
  final double mps;
  final double fps;
  final String measurementType;
  final String date;

  ManualCalcModel({
    required this.distance,
    required this.time,
    required this.mps,
    required this.fps,
    required this.measurementType,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      'distance': distance,
      'time': time,
      'mps': mps,
      'fps': fps,
      'measurementType': measurementType,
      'date': date, 
    };
  }

  factory ManualCalcModel.fromMap(Map<String, dynamic> map) {
    return ManualCalcModel(
      distance: map['distance']?.toDouble() ?? 0.0,
      time: map['time']?.toDouble() ?? 0.0,
      mps: map['mps']?.toDouble() ?? 0.0,
      fps: map['fps']?.toDouble() ?? 0.0,
      measurementType: map['measurementType'] ?? '',
      date: map['date'] ?? '',
    );
  }
}
