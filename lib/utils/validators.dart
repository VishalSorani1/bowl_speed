class Validators {
 static String? _validatePositiveNumber(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return 'Please enter the $fieldName';
    } else if (double.tryParse(value) == null || double.parse(value) <= 0) {
      return 'Value must be greater than zero';
    }
    return null;
  }

  static String? validatePitchSize(String? value) {
    return _validatePositiveNumber(value, 'Distance');
  }

  static String? validateTime(String? value) {
    return _validatePositiveNumber(value, 'Time');
  }
}
