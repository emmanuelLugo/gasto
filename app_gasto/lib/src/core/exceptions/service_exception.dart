class ServiceException implements Exception {
  final String message;
  final int? code;

  ServiceException({
    required this.message,
    this.code,
  });

  @override
  String toString() {
    return message;
  }
}
