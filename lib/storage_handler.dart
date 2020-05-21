import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

class StorageHandler {
  static Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  static Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/storage.json');
  }

  static Future<String> readStorage() async {
    try {
      final file = await _localFile;
      return await file.readAsString();
    } catch (e) {
      return await loadBaseSource();
    }
  }

  static Future<File> writeStorage(String content) async {
    final file = await _localFile;
    return file.writeAsString(content, mode: FileMode.write);
  }

  static Future<String> loadBaseSource() async {
    return await rootBundle.loadString('assets/base_source.json');
  }
}
