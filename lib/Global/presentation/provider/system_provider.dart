import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:to_do_list_app/Global/application/use_cases/get_geolocation.dart';
import 'package:to_do_list_app/Global/domain/utils/helpers/system_helper.dart';
import 'package:to_do_list_app/Global/infrastructure/datasources/system_datasource.dart';
import 'package:to_do_list_app/Global/infrastructure/repositories_impl/system_repository_impl.dart';
import 'package:to_do_list_app/Global/presentation/routes/routes.dart';

class SystemProvider extends ChangeNotifier {
  final repository = SystemRepositoryImpl(SystemDataSource());
  late final GetGeolocation _getGeolocation = GetGeolocation(repository);

  Position? position;
  int? index = 0;

  Future<void> getGeolocation(BuildContext context) async {
    final hasPermission =
        await SystemHelper.instance.handleLocationPermission(context);
    if (!hasPermission) return;
    try {
      position ??= await _getGeolocation();
      notifyListeners();
    } catch (e) {
      debugPrint('Error getting geolocation: $e');
    }
  }

  void setIndex(String path) {
    index = pages.indexWhere((element) => element['path'] == path);
    notifyListeners();
  }

  void setIndexByInt(int index) {
    this.index = index;
    notifyListeners();
  }
}
