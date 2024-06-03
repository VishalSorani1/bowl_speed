class Validators {
  static String? validatePitchSize(String? value) {
    {
      if (value == null || value.isEmpty) {
        return 'Please enter the Distance';
      } else if (value == "0") {
        return 'Value must be greater than zero';
      }
      return null;
    }
  }

  static String? validateTime(String? value) {
    {
      if (value == null || value.isEmpty) {
        return 'Please enter the Time';
      } else if (value == "0") {
        return 'Value must be greater than zero';
      }
      return null;
    }
  }
}
