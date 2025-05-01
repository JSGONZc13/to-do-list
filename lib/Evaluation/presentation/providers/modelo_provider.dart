import 'package:flutter/foundation.dart';
import 'package:to_do_list_app/Evaluation/application/models/get_evaluacion_res.dart';
import 'package:to_do_list_app/Evaluation/application/use_cases/get_modelos.dart';
import 'package:to_do_list_app/Evaluation/domain/entities/modelo_evaluacion.dart';
import 'package:to_do_list_app/Evaluation/infrastructure/data_sources/modelos_datasource.dart';
import 'package:to_do_list_app/Evaluation/infrastructure/repositories_impl/modelo_repository_impl.dart';

class ModeloProvider extends ChangeNotifier {
  final repository = ModeloRepositoryImpl(ModelosDatasource());
  late final GetModelos _getModelos = GetModelos(repository);

  List<ModeloEvaluacion> getModelosData = [];
  int? getModelosCode;
  String? getModelosMensaje;
  bool getModelosLoading = true;

  Future<void> getModelos() async {
    getModelosLoading = true;
    notifyListeners();
    try {
      final GetEvaluacionRes response = await _getModelos();
      getModelosMensaje = response.apiResponse?.message;
      getModelosCode = response.apiResponse?.code;
      if (response.apiResponse?.code == 0 && response.modelos != null) {
        getModelosData = response.modelos!;
      }
    } catch (e) {
      getModelosCode = 9999;
      getModelosData = [];
      getModelosMensaje =
          "Error al recuperar los modelos, intente nuevamente más tarde";
    } finally {
      getModelosLoading = false;
      notifyListeners();
    }
  }
}
