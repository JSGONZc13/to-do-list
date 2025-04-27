import 'package:intl/intl.dart';

class Weather {
  final DateTime date;

  Weather({
    required this.date,
  });
  String get formattedDate => DateFormat('dd/MM/yyyy').format(date);
  String get formattedDay => DateFormat('dd').format(date);
  String get formattedHour => DateFormat('HH:mm').format(date);
}
