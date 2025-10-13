import 'package:logging/logging.dart';
import 'package:polyglot/data/models/hive/hive_utils.dart';
import 'package:polyglot/data/models/transcription.dart';
import 'package:polyglot/data/models/transcription_source.dart';
import 'package:polyglot/data/models/translation.dart';
import 'package:polyglot/data/services/transcription_service.dart';
import 'package:polyglot/data/services/translation_service.dart';

class TranscriptionRepository {
  final TranscriptionService _transcriptionService;
  final TranslationService _translationService;

  TranscriptionRepository({
    required TranscriptionService transcriptionService,
    required TranslationService translationService,
  }) : _transcriptionService = transcriptionService,
       _translationService = translationService;

  final Logger _logger = Logger("TranscriptionRepository");

  bool _initialized = false;
  bool get initialized => _initialized;

  Future<void> initialize() async {
    try {
      if (initialized) return;
      await HiveUtils.openBoxes();
      _initialized = true;
    } catch (e, stack) {
      _logger.severe(
        "initialize(): Error while initializing transcription repo",
        e,
        stack,
      );
    }
  }

  Future<Transcription?> transcribe(TranscriptionSource source) async {
    try {} catch (e, stack) {
      _logger.severe("transcribe(): Error while transcribing audio", e, stack);
    }
    return null;
  }

  Future<Translation?> translate(TranscriptionSource source) async {
    try {} catch (e, stack) {
      _logger.severe("translate(): Error while translating audio", e, stack);
    }
    return null;
  }

  Future<Transcription?> getTranscription(String id) async {
    try {
      return HiveUtils.transcriptionBox.get(id);
    } catch (e, stack) {
      _logger.severe(
        "getTranscription(): Error while getting transcription by $id",
        e,
        stack,
      );
      rethrow;
    }
  }

  Future<TranscriptionSource?> getTranscriptionSource(String id) async {
    try {
      return HiveUtils.transcriptionSourceBox.get(id);
    } catch (e, stack) {
      _logger.severe(
        "getTranscriptionSource(): Error while getting transcription by $id",
        e,
        stack,
      );
      rethrow;
    }
  }
}
