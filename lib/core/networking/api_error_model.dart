class ApiErrorModel {
  final int statusCode;
  final String message;

  // Store a map of errors, where each key is a field (like "email" or "password")
  // and the value is a list of error messages for that field
  final Map<String, List<String>> errors;

  ApiErrorModel({
    required this.statusCode,
    required this.message,
    required this.errors,
  });

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) {
    return ApiErrorModel(
      // Parse the statusCode field from JSON
      statusCode: json['statusCode'] as int,

      // Parse the message field from JSON
      message: json['message'] as String,

      // Parse the errors field from JSON (Map<String, dynamic>)
      // Convert each key-value pair into a MapEntry where the value is a List<String>
      errors: (json['errors'] as Map<String, dynamic>).map(
        (key, value) => MapEntry(
          key,
          List<String>.from(value as List),
        ),
      ),
    );
  }
}
