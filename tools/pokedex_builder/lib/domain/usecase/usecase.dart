import 'package:pokedex_builder/domain/model/response.dart';

abstract class UseCase<I, O> {
  Future<Response<O>> call(I param);
}
