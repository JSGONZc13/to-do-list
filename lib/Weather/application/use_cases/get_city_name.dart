import 'package:to_do_list_app/Weather/application/repositories/weather_repository.dart';

class GetCityName {
  final WeatherRepository weatherRepository;
  GetCityName(this.weatherRepository);
  Future<String> call(String lat, String lng) async =>
      await weatherRepository.getCityName(lat, lng);
}
