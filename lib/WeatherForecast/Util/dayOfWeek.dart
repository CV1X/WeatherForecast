import 'package:intl/intl.dart';

class Util {
  // Function to convert DateTime to the day of the week
  static String getDayOfWeek(DateTime dateTime) {
    final DateFormat dayFormat = DateFormat('EEEE');
    return dayFormat.format(dateTime);
  }

  // Your other utility functions can be defined here...
}
