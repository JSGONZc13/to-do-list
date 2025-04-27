import 'package:to_do_list_app/Weather/domain/entities/weather.dart';

class WeatherForecast extends Weather {
  final DateTime date;
  final double temperature;
  final double windSpeed;
  final double rain;

  WeatherForecast({
    required this.date,
    required this.temperature,
    required this.windSpeed,
    required this.rain,
  }) : super(date: date);
}
