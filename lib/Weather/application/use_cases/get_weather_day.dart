import 'package:to_do_list_app/Weather/domain/entities/weather_daily.dart';
import 'package:to_do_list_app/Weather/application/repositories/weather_repository.dart';

class GetWeatherDay {
  final WeatherRepository repository;

  GetWeatherDay(this.repository);

  Future<WeatherDaily> call(String lat, String lng) async =>
      await repository.getWeatherDaily(lat, lng);
}
