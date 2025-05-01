import 'package:geolocator_platform_interface/src/models/position.dart';
import 'package:to_do_list_app/Global/application/repositories/system_repository.dart';
import 'package:to_do_list_app/Global/infrastructure/data_sources/system_datasource.dart';

class SystemRepositoryImpl implements SystemRepository {
  final SystemDataSource systemDataSource;

  SystemRepositoryImpl(this.systemDataSource);
  @override
  Future<Position> getGeolocation() async {
    return await systemDataSource.getCurrentPosition();
  }
}
