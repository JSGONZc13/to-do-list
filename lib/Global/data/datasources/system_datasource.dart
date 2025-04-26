import 'package:geolocator/geolocator.dart';

class SystemDataSource {
  Future<Position> getCurrentPosition() async {
    return await Geolocator.getCurrentPosition();
  }
}
