import 'package:to_do_list_app/Weather/domain/entities/weather.dart';

class WeatherDaily extends Weather {
  final int weatherCode;
  final double maxTemperature;
  final double minTemperature;
  final double rainSum;

  WeatherDaily({
    required DateTime date,
    required this.weatherCode,
    required this.maxTemperature,
    required this.minTemperature,
    required this.rainSum,
  }) : super(date: date);
}
