import 'package:to_do_list_app/Weather/domain/repositories/weather_repository.dart';

class GetWeather {
  final WeatherRepository weatherRepository;
  GetWeather(this.weatherRepository);
  Future<void> call(String lat, String lng) async =>
      await weatherRepository.getWeather(lat, lng);
}
