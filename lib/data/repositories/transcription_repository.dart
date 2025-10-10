import 'package:logging/logging.dart';
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
      _initialized = true;
    } catch (e, stack) {
      _logger.severe(
        "initialize(): Error while initializing transcription repo",
        e,
        stack,
      );
    }
  }
}
