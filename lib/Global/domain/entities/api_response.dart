class ApiResponse {
  final int? code;
  final String? message;
  final String? error;

  ApiResponse({
    required this.code,
    this.message,
    this.error,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      code: json['code'],
      message: json['message'],
      error: json['error'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'message': message,
      'error': error,
    };
  }
}
