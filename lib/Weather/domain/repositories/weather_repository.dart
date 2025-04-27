import 'package:geolocator/geolocator.dart';
import 'package:to_do_list_app/Weather/domain/entities/weather_daily.dart';
import 'package:to_do_list_app/Weather/domain/entities/weather_day.dart';

abstract class WeatherRepository {
  Future<Position> getGeolocation();
  Future<List<WeatherDay>> getWeather(String lat, String lng);
  Future<WeatherDaily> getWeatherDaily(String lat, String lng);
  Future<String> getCityName(String lat, String lng);
}
