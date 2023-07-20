import 'package:intl/intl.dart';

String convertDateTimeofEventCard(String originalDateTimeString) {
  DateTime dateTime = DateTime.parse(originalDateTimeString);
  String day = DateFormat('d').format(dateTime);
  String month = DateFormat('MMMM').format(dateTime);
  String dayOfWeek = DateFormat('EEE').format(dateTime);
  String time = DateFormat('h:mm a').format(dateTime);

  return '$day $month - $dayOfWeek - $time';
}

String convertToFormattedDateForDetailsScreen(String originalDateTimeString) {
    DateTime dateTime = DateTime.parse(originalDateTimeString);
    String formattedDate = DateFormat('d MMMM, y').format(dateTime);
    return formattedDate;
  }

    String convertToFormattedDayForDetailsScreen(String originalDateTimeString) {
    DateTime dateTime = DateTime.parse(originalDateTimeString);
    String dayOfWeek = DateFormat('EEEE').format(dateTime);
    String startTime = DateFormat('h:mm a').format(dateTime);

    // Assuming the event duration is 5 hours from the start time
    DateTime endTime = dateTime.add(Duration(hours: 5));
    String endTimeStr = DateFormat('h:mm a').format(endTime);

    return '$dayOfWeek, $startTime - $endTimeStr';
  }
