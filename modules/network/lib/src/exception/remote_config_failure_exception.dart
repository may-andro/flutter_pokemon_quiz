class RemoteConfigFailureException implements Exception {
  const RemoteConfigFailureException(this.stackTrace);

  final StackTrace stackTrace;
}
