import 'package:ffmpeg_kit_flutter_new/media_information.dart';
import 'package:file_picker/file_picker.dart';
import 'package:logging/logging.dart';
import 'package:polyglot/data/models/transcription_source.dart';
import 'package:polyglot/data/services/ffmpeg_service.dart';
import 'package:polyglot/data/services/media_picker_service.dart';
import 'package:polyglot/data/services/storage_service.dart';
import 'package:polyglot/utils/exceptions.dart';

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

  Future<TranscriptionSource?> createTranscriptionSource(
    String assetName,
    String assetPath,
  ) async {
    try {
      final info = await _ffmpegService.getAssetInfo(assetPath);
      TranscriptionSource? source;
      if (info != null) {
        source = TranscriptionSource.fromMediaInformation(info);
        source.storeMe();
      }
      _logger.info('TranscriptionSource : ${source?.type}');
      return source;
    } catch (e, stack) {
      _logger.severe("extract(): Error while extracting audio", e, stack);
    }
    return null;
  }

  Future<TranscriptionSource> extractAudio(
    TranscriptionSource source, {
    int? streamIndex,
  }) async {
    final fileName = source.name.split(".");
    fileName.removeLast();
    fileName.join(".");
    final String opPath =
        "${StorageService.appDocDirLoc}/${fileName}_${DateTime.now().millisecondsSinceEpoch}.wav";
    final result = await _ffmpegService.extractAudioAsWav(
      source.path,
      opPath,
      streamIndex: streamIndex,
    );
    if (result) {
      source = source.copyWith(extractedAudioPath: opPath);
      source.storeMe();
    }
    return source;
  }

  Future<MediaInformation?> getMediaInfo({required String assetPath}) async {
    try {
      final info = await _ffmpegService.getAssetInfo(assetPath);
      return info;
    } catch (e, stack) {
      _logger.severe(
        "getMediaInfo(): Error while extracting media info",
        e,
        stack,
      );
    }
    return null;
  }
}
