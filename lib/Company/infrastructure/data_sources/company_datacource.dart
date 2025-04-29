import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:to_do_list_app/Company/application/models/company_model.dart';
import 'package:to_do_list_app/Company/domain/utils/connections/company.dart';
import 'package:to_do_list_app/Global/domain/utils/connections/urls.dart';
import 'package:http/http.dart' as http;

class CompanyDatacource {
  final url = Uri.parse(appointmentApiHost + companyApi);
  final headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': appointmentKey,
  };
  Future<CompanyModel> addCompany(CompanyModel company) async {
    final response = await http.post(url,
        headers: headers, body: jsonEncode(company.toJson()));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return CompanyModel.fromJson(data);
    } else {
      throw Exception('Failed to create business: ${response.statusCode}');
    }
  }

  Future<List<CompanyModel>> getCompanies() async {
    debugPrint('Url: ${url}');
    final response = await http.get(url, headers: headers);
    debugPrint('Status Code: ${response.statusCode}');
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((e) => CompanyModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load companies: ${response.statusCode}');
    }
  }
}
