import 'dart:convert';
import 'package:to_do_list_app/Evaluation/application/models/get_evaluacion_res.dart';
import 'package:to_do_list_app/Evaluation/domain/utils/connections/modelo_api.dart';
import 'package:to_do_list_app/Global/domain/utils/connections/urls.dart';

import 'package:http/http.dart' as http;

class ModelosDatasource {
  Future<GetEvaluacionRes> getModelos() async {
    final url = Uri.parse(bateriaHost + modeloController + getModelosPath);
    final response = await http.post(url);

    if (response.statusCode != 200) {
      throw Exception('Failed to load modelos data: ${response.statusCode}');
    } else {
      final data = jsonDecode(response.body);
      return GetEvaluacionRes.fromJson(data);
    }
  }
}
