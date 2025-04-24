import 'package:geolocator/geolocator.dart';

abstract class WeatherRepository {
  Future<Position> getGeolocation();
}
