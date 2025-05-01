import 'package:to_do_list_app/Evaluation/domain/entities/modelo_evaluacion.dart';
import 'package:to_do_list_app/Global/domain/entities/api_response.dart';

class GetEvaluacionRes {
  final List<ModeloEvaluacion>? modelos;
  final ApiResponse? apiResponse;
  GetEvaluacionRes({
    required this.apiResponse,
    this.modelos,
  });

  factory GetEvaluacionRes.fromJson(Map<String, dynamic> json) {
    return GetEvaluacionRes(
      apiResponse: ApiResponse.fromJson(json),
      modelos: (json['modelos'] as List<dynamic>?)
          ?.map((modelo) => ModeloEvaluacion.fromJson(modelo))
          .toList(),
    );
  }
}
