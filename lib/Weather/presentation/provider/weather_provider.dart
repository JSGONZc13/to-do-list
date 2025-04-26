import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:to_do_list_app/Global/data/datasources/system_datasource.dart';
import 'package:to_do_list_app/Weather/data/datasources/weather_datasource.dart';
import 'package:to_do_list_app/Weather/data/repositories/weather_repository_impl.dart';
import 'package:to_do_list_app/Weather/domain/entities/weather_day.dart';

class WeatherProvider extends ChangeNotifier {
  final repository =
      WeatherRepositoryImpl(SystemDataSource(), WeatherDatasource());

  List<WeatherDay>? weatherData;
  String? cityName;

  Future<void> loadWeather(Position position) async {
    try {
      weatherData = await repository.getWeather(
          position.latitude.toString(), position.longitude.toString());
      cityName = await repository.getCityName(
          position.latitude.toString(), position.longitude.toString());
      notifyListeners();
    } catch (e) {
      debugPrint('Error loading weather: $e');
    }
  }
}
