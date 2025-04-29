class ResponseModel {
  final int? code;
  final String? message;
  final String? error;

  ResponseModel({
    required this.code,
    this.message,
    this.error,
  });
}
