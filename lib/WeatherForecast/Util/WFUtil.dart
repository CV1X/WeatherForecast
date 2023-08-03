import 'package:intl/intl.dart';

class Util {
  static String appId = "64eca3fe49411133d408b9661b4e3f75";

  static String getFormattedDate(DateTime dateTime) {
    return new DateFormat("EEEE").format(dateTime);
  }
}
