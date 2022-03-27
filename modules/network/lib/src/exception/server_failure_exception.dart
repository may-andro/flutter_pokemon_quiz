class ServerFailureException implements Exception {
  ServerFailureException(
    this.message, {
    this.code,
  });

  final String message;
  int? code;
}
