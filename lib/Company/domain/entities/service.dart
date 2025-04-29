class Service {
  final String? id;
  final String? name;
  final String? description;
  final double? price;
  final String? companyId;
  final dynamic company;
  final dynamic appointments;

  Service({
    this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.companyId,
    this.company,
    this.appointments,
  });
}
