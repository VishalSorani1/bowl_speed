class Labels {
  /// Manual Calculator
  static String get manualCalculator => "Manual Calculator";
  static String get pitchSize => "Pitch Size (Meter)";
  static String get timeOfTravel => "Time Of Travel (Second)";
  static String get hintOfPitchSize => "20.18";
  static String get hintOfTimeOfTravel => "20.18";

  // How to use
  static String get howToUse => "How to use";
  static String get step => "Step";
  static String get descriptionOne =>
      "In the first step,you enter the name of the bowler or pitcher.";
  static String get descriptionTwo =>
      "In the second step if you want to check speed from timer then select timer or if you want to do it from video then import video.";
  static String get descriptionThree =>
      "If you are checking with timer then press start button and check. If you want to import the video and check the speed then follow the below button.";
  static String get descriptionThreeTwo =>
      "When the ball is thrown you press the release point and the ball reaches the batsman press the reach point and check the speed.";
  static String get descriptionFour =>
      "After check the speed save the speed details for the future with date and time period.";
  static List<String> get steps => [descriptionOne, descriptionTwo, descriptionThree, descriptionFour];

  /// All Buttons
  static String get calculate => "Calculate";
  static String get releasePoint => "Release Point";
  static String get reachPoint => "Reach Point";
}
