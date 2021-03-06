// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again:
// With a Flutter package, run `flutter pub run build_runner build`.
// With a Dart package, run `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'src/entity/pokemon/local_pokemon.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(1, 1101949788672171074),
      name: 'LocalPokemon',
      lastPropertyId: const IdUid(8, 3495143028697553657),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(3, 6865180054726648182),
            name: 'name',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 1750857584068499041),
            name: 'imageUrl',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 6601190172237139464),
            name: 'isFavorite',
            type: 1,
            flags: 0),
        ModelProperty(
            id: const IdUid(7, 1234477189370874837),
            name: 'isCaptured',
            type: 1,
            flags: 0),
        ModelProperty(
            id: const IdUid(8, 3495143028697553657),
            name: 'id',
            type: 6,
            flags: 129)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[])
];

/// Open an ObjectBox store with the model declared in this file.
Future<Store> openStore(
        {String? directory,
        int? maxDBSizeInKB,
        int? fileMode,
        int? maxReaders,
        bool queriesCaseSensitiveDefault = true,
        String? macosApplicationGroup}) async =>
    Store(getObjectBoxModel(),
        directory: directory ?? (await defaultStoreDirectory()).path,
        maxDBSizeInKB: maxDBSizeInKB,
        fileMode: fileMode,
        maxReaders: maxReaders,
        queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
        macosApplicationGroup: macosApplicationGroup);

/// ObjectBox model definition, pass it to [Store] - Store(getObjectBoxModel())
ModelDefinition getObjectBoxModel() {
  final model = ModelInfo(
      entities: _entities,
      lastEntityId: const IdUid(1, 1101949788672171074),
      lastIndexId: const IdUid(1, 5990710392712861028),
      lastRelationId: const IdUid(0, 0),
      lastSequenceId: const IdUid(0, 0),
      retiredEntityUids: const [],
      retiredIndexUids: const [5990710392712861028],
      retiredPropertyUids: const [
        5436361408594617941,
        948738652830105515,
        6685515080576467581
      ],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, EntityDefinition>{
    LocalPokemon: EntityDefinition<LocalPokemon>(
        model: _entities[0],
        toOneRelations: (LocalPokemon object) => [],
        toManyRelations: (LocalPokemon object) => {},
        getId: (LocalPokemon object) => object.id,
        setId: (LocalPokemon object, int id) {
          object.id = id;
        },
        objectToFB: (LocalPokemon object, fb.Builder fbb) {
          final nameOffset = fbb.writeString(object.name);
          final imageUrlOffset = fbb.writeString(object.imageUrl);
          fbb.startTable(9);
          fbb.addOffset(2, nameOffset);
          fbb.addOffset(3, imageUrlOffset);
          fbb.addBool(4, object.isFavorite);
          fbb.addBool(6, object.isCaptured);
          fbb.addInt64(7, object.id);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = LocalPokemon(
              id: const fb.Int64Reader().vTableGet(buffer, rootOffset, 18, 0),
              name: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 8, ''),
              imageUrl: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 10, ''),
              isFavorite: const fb.BoolReader()
                  .vTableGet(buffer, rootOffset, 12, false),
              isCaptured: const fb.BoolReader()
                  .vTableGet(buffer, rootOffset, 16, false));

          return object;
        })
  };

  return ModelDefinition(model, bindings);
}

/// [LocalPokemon] entity fields to define ObjectBox queries.
class LocalPokemon_ {
  /// see [LocalPokemon.name]
  static final name =
      QueryStringProperty<LocalPokemon>(_entities[0].properties[0]);

  /// see [LocalPokemon.imageUrl]
  static final imageUrl =
      QueryStringProperty<LocalPokemon>(_entities[0].properties[1]);

  /// see [LocalPokemon.isFavorite]
  static final isFavorite =
      QueryBooleanProperty<LocalPokemon>(_entities[0].properties[2]);

  /// see [LocalPokemon.isCaptured]
  static final isCaptured =
      QueryBooleanProperty<LocalPokemon>(_entities[0].properties[3]);

  /// see [LocalPokemon.id]
  static final id =
      QueryIntegerProperty<LocalPokemon>(_entities[0].properties[4]);
}
