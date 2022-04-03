import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  const Failure(this.errorId, [this.message]);

  final int errorId;
  final String? message;

  @override
  List<Object?> get props => [errorId, message];
}
