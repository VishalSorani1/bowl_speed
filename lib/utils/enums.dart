enum MeasurementType {
  manualCalculator,
  standardCalculator;

   String getMeasurementType() {
    switch (this) {
      case MeasurementType.manualCalculator:
        return 'Manual Calculator';
      case MeasurementType.standardCalculator:
        return 'Standard Calculator';
      default:
        return '';
    }
  }
}