import 'dart:io';
import 'dart:typed_data';

import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:polyglot/utils/exceptions.dart';

class StorageService {
  static late final String rootStorageLoc;
  static String get audioDirPath => p.join(rootStorageLoc, "audio");
  static String get transcriptionDirPath =>
      p.join(rootStorageLoc, "transcriptions");
  static late final String appDocDirLoc;

  bool _gotRootStorage = false;
  bool get gotRootStorage => _gotRootStorage;

  Future<void> getStorageLocation() async {
    if (gotRootStorage) return;
    final appDir = await getExternalStorageDirectory();
    if (appDir != null) {
      rootStorageLoc = appDir.path;
      _gotRootStorage = true;
    } else {
      _gotRootStorage = false;
      throw StorageDirectoryNotAvailable();
    }
  }

  Future<void> createTranscriptionDir() async {
    Directory transcriptionsDir = Directory(transcriptionDirPath);
    if (!await transcriptionsDir.exists()) {
      transcriptionsDir.create(recursive: true);
    }
  }

  Future<void> createAudioExtractionDir() async {
    Directory audioDir = Directory(audioDirPath);
    if (!await audioDir.exists()) {
      audioDir.create(recursive: true);
    }
  }

  Future<void> creataAppDocDir() async {
    final Directory appDir = await getApplicationDocumentsDirectory();
    final String fullOutputPath = p.join(appDir.path, "audio");

    final Directory parentDir = Directory(p.dirname(fullOutputPath));
    if (!await parentDir.exists()) {
      await parentDir.create(recursive: true);
    }
    appDocDirLoc = fullOutputPath;
  }

  static Future<void> storeAudioFile(String fileName, List<int> bytes) async {
    final audioFile = File(p.join(audioDirPath, fileName));
    audioFile.writeAsBytes(bytes);
  }

  static Future<void> storeTranscriptionFile(
    String fileName,
    String contents,
  ) async {
    final audioFile = File(p.join(transcriptionDirPath, fileName));
    audioFile.writeAsString(contents);
  }

  static Future<Uint8List> readAudioFile(String fileName) async {
    final filePath = p.join(audioDirPath, fileName);
    final data = await File(filePath).readAsBytes();
    return data;
  }

  static Future<String> readTranscriptionFile(String fileName) async {
    final filePath = p.join(transcriptionDirPath, fileName);
    final data = await File(filePath).readAsString();
    return data;
  }
}
