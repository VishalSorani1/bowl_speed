import 'package:intl/intl.dart';

String formatDateTime(DateTime dateTime) {
  final DateFormat formatter = DateFormat('dd/MM/yyyy hh:mm a');
  return formatter.format(dateTime);
}