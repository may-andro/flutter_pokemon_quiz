import 'package:logger/logger.dart';

class ToolLogger {
  ToolLogger(this._logger);

  final Logger _logger;

  void w(
    String message, {
    dynamic exception,
    StackTrace? stacktrace,
  }) {
    _logger.w(message, exception, stacktrace);
  }

  void i(
    String message, {
    dynamic exception,
    StackTrace? stacktrace,
  }) {
    _logger.i(message, exception, stacktrace);
  }

  void e(
    String message, {
    dynamic exception,
    StackTrace? stacktrace,
  }) {
    _logger.e(message, exception, stacktrace);
  }

  void d(
    String message, {
    dynamic exception,
    StackTrace? stacktrace,
  }) {
    _logger.d(message, exception, stacktrace);
  }
}
