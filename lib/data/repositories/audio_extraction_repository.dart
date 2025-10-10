import 'package:logging/logging.dart';
import 'package:polyglot/data/models/transcription_source.dart';
import 'package:polyglot/data/services/ffmpeg_service.dart';
import 'package:polyglot/data/services/storage_service.dart';
import 'package:polyglot/utils/extension.dart';

class AudioExtractionRepository {
  final FfmpegService _ffmpegService;

  AudioExtractionRepository({required FfmpegService ffmpegService})
    : _ffmpegService = ffmpegService;

  final Logger _logger = Logger("AudioExtractionRepository");

  Future<TranscriptionSource?> extract(String assetPath) async {
    try {
      final info = await _ffmpegService.getAssetInfo(assetPath);
      TranscriptionSource? source;
      if (info != null) {
        if (info.getStreams().first.getType() == 'video') {
          final result = await _ffmpegService.extractAudioFromVideoToWav(
            assetPath,
            StorageService.audioDirPath,
          );
          if (result) {
            source = info.toTranscriptionSource();
          }
        } else {
          source = info.toTranscriptionSource();
        }
      }
      return source;
    } catch (e, stack) {
      _logger.severe("extract(): Error while extracting audio", e, stack);
    }
    return null;
  }
}
