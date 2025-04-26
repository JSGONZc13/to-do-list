import 'dart:math';

import 'package:geolocator_platform_interface/src/models/position.dart';
import 'package:intl/intl.dart';
import 'package:to_do_list_app/Global/data/datasources/system_datasource.dart';
import 'package:to_do_list_app/Weather/data/datasources/weather_datasource.dart';
import 'package:to_do_list_app/Weather/domain/entities/weather_day.dart';
import 'package:to_do_list_app/Weather/domain/entities/weather_forecast.dart';
import 'package:to_do_list_app/Weather/domain/repositories/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final SystemDataSource systemDataSource;
  final WeatherDatasource weatherDatasource;
  WeatherRepositoryImpl(this.systemDataSource, this.weatherDatasource);
  @override
  Future<Position> getGeolocation() async {
    return await systemDataSource.getCurrentPosition();
  }

  @override
  Future<List<WeatherDay>> getWeather(String lat, String lng) async {
    final json = await weatherDatasource.getWeather(lat, lng);

    final Map<String, List<WeatherForecast>> groupedForecasts = {};
    final List<WeatherDay> forecasts = [];
    final times = json['hourly']['time'] as List<dynamic>;
    final temps = json['hourly']['temperature_2m'] as List<dynamic>;
    final winds = json['hourly']['wind_speed_180m'] as List<dynamic>;
    final rains = json['hourly']['rain'] as List<dynamic>;

    for (int i = 0; i < times.length; i++) {
      final date = DateTime.parse(times[i]);
      final dayKey = DateFormat('dd/MM/yyyy').format(date);

      final forecast = WeatherForecast(
        date: date,
        temperature: temps[i]?.toDouble() ?? 0.0,
        windSpeed: winds[i]?.toDouble() ?? 0.0,
        rain: rains[i]?.toDouble() ?? 0.0,
      );

      groupedForecasts.putIfAbsent(dayKey, () => []);
      groupedForecasts[dayKey]!.add(forecast);
    }

    for (var entry in groupedForecasts.entries) {
      forecasts.add(WeatherDay(
        date: DateFormat('dd/MM/yyyy').parse(entry.key),
        minTemperature:
            entry.value.map((forecast) => forecast.temperature).reduce(min),
        maxTemperature:
            entry.value.map((forecast) => forecast.temperature).reduce(max),
        minWindSpeed:
            entry.value.map((forecast) => forecast.windSpeed).reduce(min),
        maxWindSpeed:
            entry.value.map((forecast) => forecast.windSpeed).reduce(max),
        minRain: entry.value.map((forecast) => forecast.rain).reduce(min),
        maxRain: entry.value.map((forecast) => forecast.rain).reduce(max),
      ));
    }

    return forecasts;
  }

  @override
  Future<String> getCityName(String lat, String lng) async {
    final cityName_ = await weatherDatasource.getCityName(lat, lng);
    return cityName_.toString();
  }
}
