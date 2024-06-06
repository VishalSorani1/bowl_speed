class ManualCalcModel {
  final double distance;
  final double time;
  final double kmh;
  final double mph;
  final String measurementType;
  final String date;

  ManualCalcModel({
    required this.distance,
    required this.time,
    required this.kmh,
    required this.mph,
    required this.measurementType,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      'distance': distance,
      'time': time,
      'kmh': kmh,
      'mph': mph,
      'measurementType': measurementType,
      'date': date, 
    };
  }

  factory ManualCalcModel.fromMap(Map<String, dynamic> map) {
    return ManualCalcModel(
      distance: map['distance']?.toDouble() ?? 0.0,
      time: map['time']?.toDouble() ?? 0.0,
      kmh: map['kmh']?.toDouble() ?? 0.0,
      mph: map['mph']?.toDouble() ?? 0.0,
      measurementType: map['measurementType'] ?? '',
      date: map['date'] ?? '',
    );
  }
}
