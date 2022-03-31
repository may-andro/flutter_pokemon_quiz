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

extension ResponseExtension<T> on Response {
  bool get isSuccess => this is Success<T>;

  bool get isLoading => this is Loading<T>;

  bool get isFailure => this is Failure<T>;
}
