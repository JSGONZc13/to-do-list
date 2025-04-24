import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:to_do_list_app/Global/core/utils/system_helper.dart';
import 'package:to_do_list_app/Global/data/datasources/system_datasource.dart';
import 'package:to_do_list_app/Weather/data/repositories/weather_repository_impl.dart';
import 'package:to_do_list_app/Weather/domain/use_cases/get_geolocation.dart';

class WeatherProvider extends ChangeNotifier {
  final repository = WeatherRepositoryImpl(SystemDataSource());
  late final GetGeolocation _getGeolocation = GetGeolocation(repository);

  Position? position;
  Future<void> getGeolocation(context) async {
    final hasPermission =
        await SystemHelper.instance.handleLocationPermission(context);
    if (!hasPermission) return;
    try {
      position = await _getGeolocation();
      notifyListeners();
    } catch (e) {
      debugPrint('Error getting geolocation: $e');
    }
  }
}
