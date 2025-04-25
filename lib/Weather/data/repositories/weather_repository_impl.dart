import 'package:geolocator_platform_interface/src/models/position.dart';
import 'package:intl/intl.dart';
import 'package:to_do_list_app/Global/data/datasources/system_datasource.dart';
import 'package:to_do_list_app/Weather/data/datasources/weather_datasource.dart';
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
  Future<Map<String, List<WeatherForecast>>> getWeather(
      String lat, String lng) async {
    final json = await weatherDatasource.getWeather(lat, lng);

    final Map<String, List<WeatherForecast>> groupedForecasts = {};

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

    return groupedForecasts;
  }

  @override
  Future<String> getCityName(String lat, String lng) async {
    final cityName_ = await weatherDatasource.getCityName(lat, lng);
    return cityName_.toString();
  }
}
