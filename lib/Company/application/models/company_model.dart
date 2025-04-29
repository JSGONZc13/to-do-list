import 'package:to_do_list_app/Company/domain/entities/company.dart';
import 'package:to_do_list_app/Company/domain/entities/employee.dart';
import 'package:to_do_list_app/Company/domain/entities/service.dart';

class CompanyModel extends Company {
  CompanyModel({
    super.id,
    required super.name,
    required super.address,
    required super.phone,
    required super.email,
    required super.website,
    super.isActive,
    super.employees,
    super.services,
  });

  factory CompanyModel.fromJson(Map<String, dynamic> map) {
    return CompanyModel(
      id: map['id'] as String?,
      name: map['name'] as String?,
      address: map['address'] as String?,
      phone: map['phone'] as String?,
      email: map['email'] as String?,
      website: map['website'] as String?,
      isActive: map['isActive'] as bool?,
      employees: map['employees'] as List<Employee>?,
      services: map['services'] as List<Service>?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'address': address,
      'phone': phone,
      'email': email,
      'website': website,
    };
  }
}
