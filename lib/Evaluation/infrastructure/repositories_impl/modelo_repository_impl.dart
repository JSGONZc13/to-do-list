import 'package:to_do_list_app/Evaluation/application/models/get_evaluacion_res.dart';
import 'package:to_do_list_app/Evaluation/domain/repositories/modelo_repository.dart';
import 'package:to_do_list_app/Evaluation/infrastructure/data_sources/modelos_datasource.dart';

class ModeloRepositoryImpl implements ModeloRepository {
  final ModelosDatasource modelDatasource;
  ModeloRepositoryImpl(this.modelDatasource);
  @override
  Future<GetEvaluacionRes> getModelos() async =>
      await modelDatasource.getModelos();
}
