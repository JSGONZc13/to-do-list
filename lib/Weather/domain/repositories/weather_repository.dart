import 'package:geolocator/geolocator.dart';
import 'package:to_do_list_app/Weather/domain/entities/weather_forecast.dart';

abstract class WeatherRepository {
  Future<Position> getGeolocation();
  Future<Map<String, List<WeatherForecast>>> getWeather(String lat, String lng);
  Future<String> getCityName(String lat, String lng);
}
