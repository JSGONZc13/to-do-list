import 'package:to_do_list_app/Weather/domain/entities/weather.dart';

class WeatherDay extends Weather {
  final double minTemperature;
  final double maxTemperature;
  final double minWindSpeed;
  final double maxWindSpeed;
  final double minRain;
  final double maxRain;

  WeatherDay({
    required DateTime date,
    required this.minTemperature,
    required this.maxTemperature,
    required this.minWindSpeed,
    required this.maxWindSpeed,
    required this.minRain,
    required this.maxRain,
  }) : super(date: date);
}
