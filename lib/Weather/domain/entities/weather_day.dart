import 'package:intl/intl.dart';

class WeatherDay{
  final DateTime date;
  final double minTemperature;
  final double maxTemperature;
  final double minWindSpeed;
  final double maxWindSpeed;
  final double minRain;
  final double maxRain;

  WeatherDay({
    required this.date,
    required this.minTemperature,
    required this.maxTemperature,
    required this.minWindSpeed,
    required this.maxWindSpeed,
    required this.minRain,
    required this.maxRain,
  });
  String get formattedDate => DateFormat('dd/MM/yyyy').format(date);
  String get formattedDay => DateFormat('dd').format(date);
  String get formattedHour => DateFormat('HH:mm').format(date);


}