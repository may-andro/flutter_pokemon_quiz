import 'package:dartz/dartz.dart';
import 'package:data/data.dart';
import 'package:domain/mapper/mapper.dart';
import 'package:domain/model/model.dart';
import 'package:injectable/injectable.dart';

@injectable
class FetchPokedexUseCase {
  FetchPokedexUseCase(
    this._pokedexRepository,
    this._pokedexRemoteMapper,
  );

  final PokedexRepository _pokedexRepository;
  final PokedexRemoteMapper _pokedexRemoteMapper;

  Future<Either<Failure, Pokedex>> call(String region) async {
    try {
      final remotePokedex = await _pokedexRepository.fetchPokedex(region);
      final pokedex = _pokedexRemoteMapper.mapFromEntityToModel(remotePokedex);
      return Right(pokedex);
    } catch (e) {
      return Left(Failure(ERROR_SERVER_ID));
    }
  }
}
