String _addLeadingZero(int number) {
  return number.toString().padLeft(2, '0');
}

String _getMonthName(int month) {
  const List<String> months = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec"
  ];
  return months[month - 1];
}

String _getPeriod(int hour) {
  return hour >= 12 ? "PM" : "AM";
}

String epochToFormattedDate(int epoch) {
  DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(epoch);
  String formattedDate =
      "${_addLeadingZero(dateTime.day)} ${_getMonthName(dateTime.month)} ${dateTime.year} at ${_addLeadingZero(dateTime.hour % 12)}:${_addLeadingZero(dateTime.minute)} ${_getPeriod(dateTime.hour)}";
  return formattedDate;
}

double paisaToRupees(int paisa) {
  return paisa / 100.0;
}

int rupeesToPaisa(double rupees) {
  return (rupees * 100).round();
}

double convertMoneyStringToDouble(String input) {
  // Remove commas from the input string
  String cleanedString = input.replaceAll(',', '');

  // Parse the cleaned string to a double
  double result = double.tryParse(cleanedString) ?? 0.0;

  return result;
}
