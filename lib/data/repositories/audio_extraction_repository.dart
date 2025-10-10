import 'package:file_picker/file_picker.dart';
import 'package:logging/logging.dart';
import 'package:polyglot/data/models/transcription_source.dart';
import 'package:polyglot/data/services/ffmpeg_service.dart';
import 'package:polyglot/data/services/media_picker_service.dart';
import 'package:polyglot/data/services/storage_service.dart';
import 'package:polyglot/utils/exceptions.dart';
import 'package:polyglot/utils/extension.dart';

class AudioExtractionRepository {
  final FfmpegService _ffmpegService;
  final MediaPickerService _mediaPickerService;

  AudioExtractionRepository({
    required FfmpegService ffmpegService,
    required MediaPickerService mediaPickerService,
  }) : _ffmpegService = ffmpegService,
       _mediaPickerService = mediaPickerService;

  final Logger _logger = Logger("AudioExtractionRepository");

  Future<PlatformFile> pickMedia({bool isAudio = false}) async {
    try {
      final file = isAudio
          ? await _mediaPickerService.pickAudioFile()
          : await _mediaPickerService.pickVideoFile();
      if (file == null) throw MediaFileNotFound();
      return file;
    } catch (e, stack) {
      _logger.severe("extract(): Error while picking media", e, stack);
      rethrow;
    }
  }

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
