abstract class Response<T> {}

class Success<T> extends Response<T> {
  final T data;

  Success({required this.data});
}

class Failure<T> extends Response<T> {
  final Object error;

  Failure({required this.error});
}

class Loading<T> extends Response<T> {
  final T? data;

  Loading({this.data});
}

extension ResponseExtension on Response {
  bool get isSuccess => this is Success;

  bool get isLoading => this is Loading;

  bool get isFailure => this is Failure;
}
