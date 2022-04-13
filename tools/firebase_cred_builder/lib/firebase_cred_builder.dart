import 'dart:convert';
import 'dart:io';

Future<void> saveToFile({
  required String path,
  required Map<String, dynamic> collectionJson,
}) {
  return File(path).writeAsString(
    const JsonEncoder.withIndent('  ').convert(collectionJson),
    mode: FileMode.write,
  );
}

Map<String, dynamic> createJson(String credential) {
  final map = jsonDecode(credential);
  return map;
}
