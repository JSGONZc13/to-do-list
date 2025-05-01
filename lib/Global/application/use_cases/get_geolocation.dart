import 'package:geolocator/geolocator.dart';
import 'package:to_do_list_app/Global/domain/repositories/system_repository.dart';

class GetGeolocation {
  final SystemRepository systemRepository;
  GetGeolocation(this.systemRepository);
  Future<Position> call() async => await systemRepository.getGeolocation();
}
