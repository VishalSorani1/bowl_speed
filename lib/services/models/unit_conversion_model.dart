// lib/models/unit.dart

class UnitConversion {
  final String name;
  final double conversionFactor;

  const UnitConversion(this.name, this.conversionFactor);

   static double convert(double value,double unitFrom, double toUnit) {
    return value * (toUnit/ unitFrom);
  }

  @override
  String toString() => name;
}
