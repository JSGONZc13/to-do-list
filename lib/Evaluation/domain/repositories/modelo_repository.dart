import 'package:to_do_list_app/Evaluation/domain/entities/modelo_evaluacion.dart';
import 'package:to_do_list_app/Global/domain/entities/api_response.dart';

abstract class ModeloRepository {
  Future<(List<ModeloEvaluacion>, ApiResponse)> getModelos();
}
