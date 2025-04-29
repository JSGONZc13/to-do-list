import 'package:to_do_list_app/Company/domain/entities/employee.dart';
import 'package:to_do_list_app/Company/domain/entities/service.dart';

class Company {
  final String? id;
  final String? name;
  final String? address;
  final String? phone;
  final String? email;
  final String? website;
  final bool? isActive;
  final List<Employee>? employees;
  final List<Service>? services;
  Company(
      {this.id,
      required this.name,
      required this.address,
      required this.phone,
      required this.email,
      required this.website,
      this.isActive,
      this.employees,
      this.services});
}
