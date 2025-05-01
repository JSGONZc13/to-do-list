import 'package:to_do_list_app/Evaluation/domain/entities/modelo_evaluacion.dart';
import 'package:to_do_list_app/Evaluation/domain/repositories/modelo_repository.dart';
import 'package:to_do_list_app/Evaluation/infrastructure/data_sources/modelos_datasource.dart';
import 'package:to_do_list_app/Global/domain/entities/api_response.dart';

class ModeloRepositoryImpl implements ModeloRepository {
  final ModelosDatasource modelDatasource;
  ModeloRepositoryImpl(this.modelDatasource);
  @override
  Future<(List<ModeloEvaluacion>, ApiResponse)> getModelos() async =>
      await modelDatasource.getModelos();
}
