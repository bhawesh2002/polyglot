import 'dart:typed_data';

import 'package:logging/logging.dart';
import 'package:polyglot/data/services/storage_service.dart';

class StorageRepository {
  final StorageService _storageService;
  StorageRepository({required StorageService storageService})
      : _storageService = storageService;

  final Logger _logger = Logger("StorageRepository");

  bool _initialized = false;
  bool get initialized => _initialized;

  Future<void> initialize() async {
    try {
      if (initialized) return;
      await _storageService.getStorageLocation();
      await _storageService.createTranscriptionDir();
      await _storageService.createTranscriptionDir();
      _logger.info("Storage Root: ${StorageService.rootStorageLoc}");
      _logger.info("Audio Dir: ${StorageService.audioDirPath}");
      _logger.info("Transcription dir: ${StorageService.transcriptionDirPath}");

      _initialized = true;
    } catch (e, stack) {
      _logger.severe(
          "initialize(): Error while initializing storage repo", e, stack);
    }
  }

  Future<Uint8List> readAudioFile(String fileName) async {
    final file = await StorageService.readAudioFile(fileName);
    return file;
  }

  Future<String> readTranscriptionFile(String fileName) async {
    final file = await StorageService.readTranscriptionFile(fileName);
    return file;
  }
}
