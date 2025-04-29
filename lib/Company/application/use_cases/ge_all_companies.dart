import 'package:to_do_list_app/Company/domain/entities/company.dart';
import 'package:to_do_list_app/Company/domain/repositories/company_repository.dart';

class GetAllCompanies {
  final CompanyRepository _companyRepository;

  GetAllCompanies(this._companyRepository);

  Future<List<Company>> call() async => await _companyRepository.getCompanies();
}
