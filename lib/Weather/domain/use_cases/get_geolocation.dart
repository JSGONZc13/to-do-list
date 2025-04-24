import 'package:geolocator/geolocator.dart';
import 'package:to_do_list_app/Weather/domain/repositories/weather_repository.dart';

class GetGeolocation {
  final WeatherRepository weatherRepository;
  GetGeolocation(this.weatherRepository);
  Future<Position> call() async => await weatherRepository.getGeolocation();
}
