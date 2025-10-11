import 'dart:typed_data';

import 'package:logging/logging.dart';
import 'package:polyglot/data/services/media_picker_service.dart';
import 'package:polyglot/data/services/storage_service.dart';

class StorageRepository {
  final StorageService _storageService;
  final MediaPickerService _mediaPickerService;
  StorageRepository({
    required StorageService storageService,
    required MediaPickerService mediaPickerService,
  }) : _storageService = storageService,
       _mediaPickerService = mediaPickerService;

  final Logger _logger = Logger("StorageRepository");

  bool _initialized = false;
  bool get initialized => _initialized;

  Future<void> initialize() async {
    try {
      if (initialized) return;
      await _storageService.getStorageLocation();
      await _storageService.createTranscriptionDir();
      await _storageService.createTranscriptionDir();
      await _storageService.creataAppDocDir();
      _initialized = true;
    } catch (e, stack) {
      _logger.severe(
        "initialize(): Error while initializing storage repo",
        e,
        stack,
      );
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

  Future<String?> pickStorageLocation() async {
    final path = await _mediaPickerService.pickAFolder();
    return path;
  }
}
