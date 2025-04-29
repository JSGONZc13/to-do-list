import 'package:to_do_list_app/Company/domain/entities/company.dart';
import 'package:to_do_list_app/Company/domain/repositories/company_repository.dart';

class AddCompany {
  final CompanyRepository companyRepository;
  AddCompany(this.companyRepository);
  Future<void> call(Company company) async =>
      await companyRepository.addCompany(company);
}
