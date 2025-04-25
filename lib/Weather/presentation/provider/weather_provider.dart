import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:to_do_list_app/Global/core/utils/system_helper.dart';
import 'package:to_do_list_app/Global/data/datasources/system_datasource.dart';
import 'package:to_do_list_app/Weather/data/datasources/weather_datasource.dart';
import 'package:to_do_list_app/Weather/data/repositories/weather_repository_impl.dart';
import 'package:to_do_list_app/Weather/domain/entities/weather_forecast.dart';
import 'package:to_do_list_app/Weather/domain/use_cases/get_geolocation.dart';

class WeatherProvider extends ChangeNotifier {
  final repository =
      WeatherRepositoryImpl(SystemDataSource(), WeatherDatasource());
  late final GetGeolocation _getGeolocation = GetGeolocation(repository);

  Position? position;
  Map<String, List<WeatherForecast>>? weatherData;
  String? cityName;
  Future<void> getGeolocation(context) async {
    final hasPermission =
        await SystemHelper.instance.handleLocationPermission(context);
    if (!hasPermission) return;
    try {
      position ??= await _getGeolocation();
      notifyListeners();
      await getCityName();
      await getWeather();
    } catch (e) {
      debugPrint('Error getting geolocation: $e');
    }
  }

  Future<void> getWeather() async {
    if (position == null) return;
    try {
      weatherData = await repository.getWeather(
          position!.latitude.toString(), position!.longitude.toString());
      notifyListeners();
    } catch (e) {
      debugPrint('Error getting weather: $e');
    }
  }

  Future<void> getCityName() async {
    if (position == null) return;
    try {
      cityName ??= await repository.getCityName(
          position!.latitude.toString(), position!.longitude.toString());
      notifyListeners();
    } catch (e) {
      debugPrint('Error getting city name: $e');
    }
  }
}
