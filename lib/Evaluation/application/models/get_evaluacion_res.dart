import 'package:to_do_list_app/Evaluation/domain/entities/modelo_evaluacion.dart';
import 'package:to_do_list_app/Global/application/models/response_model.dart';

class GetEvaluacionRes extends ResponseModel {
  final List<ModeloEvaluacion>? modelos;
  GetEvaluacionRes({
    required super.code,
    super.message,
    super.error,
    this.modelos,
  });

  factory GetEvaluacionRes.fromJson(Map<String, dynamic> json) {
    return GetEvaluacionRes(
      code: json['code'],
      message: json['message'],
      modelos: json['modelos'] != null
          ? (json['modelos'] as List)
              .map((e) => ModeloEvaluacion.fromJson(e))
              .toList()
          : null,
      error: json['error'],
    );
  }
}
