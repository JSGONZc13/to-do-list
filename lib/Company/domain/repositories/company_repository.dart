import 'package:to_do_list_app/Company/domain/entities/company.dart';

abstract class CompanyRepository {
  Future<List<Company>> getCompanies();
  Future<Company> addCompany(Company company);
}
