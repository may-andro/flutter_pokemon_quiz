import 'dart:convert';
import 'dart:io';

import 'package:args/args.dart';
import 'package:pokedex_builder/domain/model/pokemon.dart';
import 'package:pokedex_builder/pokedex_builder.dart';

Future<void> main(List<String> arguments) async {
  setupPokedexBuilder();
  print('Pokedex builder started');
  try {
    final parser = _getArgParser();
    final parsedArguments = _getParsedArguments(parser, arguments);
    final flavor = parsedArguments['flavor'];
    final filePath = parsedArguments['filePath'];
    final pokemons = await fetchPokemon(flavor);
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
    logInfo(parser.usage);
    exit(0);
  }
}

Future<void> _saveToFile({
  required String path,
  required Map<String, dynamic> collectionJson,
}) {
  return File(path).writeAsString(
    const JsonEncoder.withIndent('  ').convert(collectionJson),
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
