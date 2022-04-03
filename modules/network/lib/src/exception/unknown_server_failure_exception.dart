class UnknownServerFailureException implements Exception {
  const UnknownServerFailureException(this.stackTrace);

  final StackTrace stackTrace;
}
