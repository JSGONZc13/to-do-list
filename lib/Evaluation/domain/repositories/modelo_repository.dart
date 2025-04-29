import 'package:to_do_list_app/Evaluation/application/models/get_evaluacion_res.dart';

abstract class ModeloRepository {
  Future<GetEvaluacionRes> getModelos();
}
