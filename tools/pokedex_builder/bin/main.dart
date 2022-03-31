import 'dart:convert';
import 'dart:io';

import 'package:args/args.dart';
import 'package:pokedex_builder/domain/model/pokemon.dart';
import 'package:pokedex_builder/pokedex_builder.dart';

Future<void> main(List<String> arguments) async {
  print('Pokedex builder started');
  try {
    final parser = _getArgParser();
    final parsedArguments = _getParsedArguments(parser, arguments);
    final flavor = parsedArguments['flavor'];
    final filePath = parsedArguments['filePath'];
    final startIndex = _fetchStartIndex(flavor);
    final endIndex = _fetchEndIndex(flavor);
    final pokemons = await fetchPokemon(startIndex, endIndex);
    await _saveToFile(
      path: filePath,
      collectionJson: _createCollectionJson(pokemons, flavor),
    );
    print('Successfully build pokedex and saved at $filePath');
  } catch (e) {
    print('Caught error:$e');
  } finally {
    exit(0);
  }
}

int _fetchStartIndex(String flavor) {
  switch (flavor) {
    case 'kanto':
      return 1;
    case 'jhoto':
      return 152;
    default:
      throw Exception('Not a valid flavor');
  }
}

int _fetchEndIndex(String flavor) {
  switch (flavor) {
    case 'kanto':
      return 151;
    case 'jhoto':
      return 251;
    default:
      throw Exception('Not a valid flavor');
  }
}

ArgParser _getArgParser() {
  final argParser = ArgParser();
  argParser.addOption(
    'flavor',
    abbr: 'f',
    help: 'flavor to fetch and export pokemon from',
  );

  argParser.addOption(
    'filePath',
    abbr: 'p',
    help: 'file path to save the json data',
  );

  return argParser;
}

ArgResults _getParsedArguments(ArgParser parser, List<String> arguments) {
  final argResults = parser.parse(arguments);
  if (argResults.wasParsed('flavor')) {
    return argResults;
  } else {
    print(parser.usage);
    exit(0);
  }
}

Future<void> _saveToFile({
  required String path,
  required Map<String, dynamic> collectionJson,
}) {
  return File(path).writeAsString(
    JsonEncoder.withIndent('  ').convert(collectionJson),
    mode: FileMode.write,
  );
}

Map<String, dynamic> _createCollectionJson(
  List<Pokemon> pokemon,
  String flavor,
) {
  return <String, dynamic>{
    'collection:pokedex': <String, dynamic>{
      flavor: <String, dynamic>{
        'pokemon': pokemon,
      }
    }
  };
}
