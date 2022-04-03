class FireStoreFailureException implements Exception {
  const FireStoreFailureException(this.stackTrace);

  final StackTrace stackTrace;
}
