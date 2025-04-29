import 'package:to_do_list_app/Company/application/models/company_model.dart';
import 'package:to_do_list_app/Company/domain/entities/company.dart';
import 'package:to_do_list_app/Company/domain/repositories/company_repository.dart';
import 'package:to_do_list_app/Company/infrastructure/data_sources/company_datacource.dart';

class CompanyRepositoryImpl implements CompanyRepository {
  final CompanyDatacource companyDatacource;
  CompanyRepositoryImpl(this.companyDatacource);
  @override
  Future<Company> addCompany(Company company) async {
    CompanyModel companyModel = CompanyModel(
        id: company.id,
        name: company.name,
        address: company.address,
        phone: company.phone,
        email: company.email,
        website: company.website);
    Company company_ = await companyDatacource.addCompany(companyModel);
    return company_;
  }

  @override
  Future<List<Company>> getCompanies() async =>
      await companyDatacource.getCompanies();
}
