import 'package:domain/src/model/error/failure.dart';
import 'package:domain/src/model/pokedex/pokedex.dart';
import 'package:domain/src/usecase/pokedex/fetch_pokedex_usecase.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dartz/dartz.dart';

class MockedFetchPokedexUseCase extends Mock implements FetchPokedexUseCase {
  void mockRightCall(Pokedex expected) {
    when(() => call(any())).thenAnswer((_) async => Right(expected));
  }

  void mockLeftCall(Failure expected) {
    when(() => call(any())).thenAnswer((_) async => Left(expected));
  }
}
