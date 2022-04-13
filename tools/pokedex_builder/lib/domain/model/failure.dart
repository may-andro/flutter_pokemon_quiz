class Failure {
  const Failure(this.exception, [this.stackTrace]);

  final Exception exception;
  final StackTrace? stackTrace;
}
