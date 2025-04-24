import 'package:geolocator_platform_interface/src/models/position.dart';
import 'package:to_do_list_app/Global/data/datasources/system_datasource.dart';
import 'package:to_do_list_app/Weather/domain/repositories/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final SystemDataSource systemDataSource;
  WeatherRepositoryImpl(this.systemDataSource);
  @override
  Future<Position> getGeolocation() async {
    return await systemDataSource.getCurrentPosition();
  }
}
