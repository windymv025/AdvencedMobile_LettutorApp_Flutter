import 'package:intl/intl.dart';

String getStringTime(DateTime dateTime) {
  DateTime now = DateTime.now();
  DateTime temp = DateTime(
      now.year - dateTime.year,
      now.month - dateTime.month,
      now.day - dateTime.day,
      now.hour - dateTime.hour,
      now.minute - dateTime.minute,
      now.second - dateTime.second);
  String result = "";
  if (dateTime.year == now.year) {
    if (dateTime.month == now.month) {
      if (dateTime.day == now.day) {
        if (dateTime.hour == now.hour) {
          result = "${DateFormat("mm").format(temp)} ago";
        } else {
          result = "${DateFormat("HH:mm").format(temp)} ago";
        }
      } else {
        if (now.day - dateTime.day < 7) {
          result = DateFormat("EEE, HH:mm").format(dateTime);
        } else {
          result = DateFormat("MMM dd").format(dateTime);
        }
      }
    } else {
      result = DateFormat("MMM dd").format(dateTime);
    }
  } else {
    result = DateFormat("MMM dd, yyyy").format(dateTime);
  }

  return result;
}
