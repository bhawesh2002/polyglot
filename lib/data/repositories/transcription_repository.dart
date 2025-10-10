import 'package:polyglot/data/services/ffmpeg_service.dart';
import 'package:polyglot/data/services/transcription_service.dart';
import 'package:polyglot/data/services/translation_service.dart';

class TranscriptionRepository {
  final FfmpegService _ffmpegService;
  final TranscriptionService _transcriptionService;
  final TranslationService _translationService;

  TranscriptionRepository({
    required FfmpegService ffmpegService,
    required TranscriptionService transcriptionService,
    required TranslationService translationService,
  }) : _ffmpegService = ffmpegService,
       _transcriptionService = transcriptionService,
       _translationService = translationService;
}
