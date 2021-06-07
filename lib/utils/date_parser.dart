import 'package:intl/intl.dart';

class DateParser {
  static String getDate(String date) {
    final f = new DateFormat('yyyy-MM-dd').parse(date);
    return new DateFormat.yMMMd().format(f);
  }

  static String getTime(String date) {
    return DateFormat.jm().format(DateTime.parse(date));
  }
}
