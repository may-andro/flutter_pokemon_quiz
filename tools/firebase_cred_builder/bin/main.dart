import 'dart:io';

import 'package:args/args.dart';
import 'package:firebase_cred_builder/firebase_cred_builder.dart';

Future<void> main(List<String> arguments) async {
  print('Pokedex builder started');
  try {
    final parser = _getArgParser();
    final parsedArguments = _getParsedArguments(parser, arguments);
    final credential = parsedArguments['credential'];
    final filePath = parsedArguments['filePath'];
    await saveToFile(path: filePath, collectionJson: createJson(credential));
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
    'credential',
    abbr: 'c',
    help: 'Firebase credential string JSON',
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
  if (argResults.wasParsed('credential') && argResults.wasParsed('filePath')) {
    return argResults;
  } else {
    print(parser.usage);
    exit(0);
  }
}
