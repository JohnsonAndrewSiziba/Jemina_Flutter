import 'dart:async';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

class FileStorageManager {
  static final FileStorageManager _instance = FileStorageManager._internal();

  // using a factory is important
  // because it promises to return _an_ object of this type
  // but it doesn't promise to make a new one.
  factory FileStorageManager() {
    return _instance;
  }

  // This named constructor is the "real" constructor
  // It'll be called exactly once, by the static property assignment above
  // it's also private, so it can only be called in this class
  FileStorageManager._internal() {
    // initialization logic
  }


  /// these are just examples

  Future<String> get localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get localFile async {
    final path = await localPath;
    return File('$path/counter.txt');
  }

  Future<int> readCounter() async {
    try {
      final file = await localFile;

      // Read the file
      final contents = await file.readAsString();

      return int.parse(contents);
    } catch (e) {
      // If encountering an error, return 0
      return 0;
    }
  }

  Future<File> writeCounter(int counter) async {
    final file = await localFile;

    // Write the file
    return file.writeAsString('$counter');
  }

}

///REFERENCES
///https://docs.flutter.dev/cookbook/persistence/reading-writing-files
///https://stackoverflow.com/questions/41369633/how-to-save-to-local-storage-using-flutter