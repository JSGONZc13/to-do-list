import 'package:flutter/foundation.dart';
import 'package:to_do_list_app/Company/application/use_cases/ge_all_companies.dart';
import 'package:to_do_list_app/Company/domain/entities/company.dart';
import 'package:to_do_list_app/Company/infrastructure/data_sources/company_datacource.dart';
import 'package:to_do_list_app/Company/infrastructure/repositories_impl/company_repository_impl.dart';

class CompanyProvider extends ChangeNotifier {
  final repository = CompanyRepositoryImpl(CompanyDatacource());
  late final GetAllCompanies _getCompanies = GetAllCompanies(repository);

  List<Company> companiesData = [];

  Future<void> getCompanies() async {
    companiesData = await _getCompanies();
    notifyListeners();
  }

  Future<void> addCompany(Company company) async {
    await repository.addCompany(company);
    await getCompanies();
  }
}
