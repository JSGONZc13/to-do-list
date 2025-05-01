import 'package:to_do_list_app/Evaluation/application/models/get_evaluacion_res.dart';
import 'package:to_do_list_app/Evaluation/domain/repositories/modelo_repository.dart';

class GetModelos {
  final ModeloRepository modeloRepository;
  GetModelos(this.modeloRepository);
  Future<GetEvaluacionRes> call() async {
    final (modelos, apiResponse) = await modeloRepository.getModelos();
    return GetEvaluacionRes(
      apiResponse: apiResponse,
      modelos: modelos,
    );
  }
}
