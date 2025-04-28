import 'package:geolocator/geolocator.dart';

abstract class SystemRepository {
  Future<Position> getGeolocation();
}
