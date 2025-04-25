import 'package:intl/intl.dart';

class WeatherForecast {
  final DateTime date;
  final double temperature;
  final double windSpeed;
  final double rain;

  WeatherForecast({
    required this.date,
    required this.temperature,
    required this.windSpeed,
    required this.rain,
  });

  String get formattedDate => DateFormat('dd/MM/yyyy HH:mm').format(date);
  String get formattedHour => DateFormat('HH:mm').format(date);
}
