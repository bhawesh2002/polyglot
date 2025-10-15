import 'package:logging/logging.dart';
import 'package:polyglot/data/models/media_stream.dart';
import 'package:polyglot/data/models/transcription_source.dart';
import 'package:polyglot/data/repositories/audio_extraction_repository.dart';
import 'package:polyglot/data/repositories/transcription_repository.dart';
import 'package:polyglot/data/repositories_provider.dart';
import 'package:polyglot/ui/home/view_model/state/home_vm_state.dart';
import 'package:polyglot/utils/exceptions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_vm.g.dart';

@riverpod
class HomeVm extends _$HomeVm {
  @override
  HomeVmState build() {
    _audioExtractionRepository = ref.watch(audioExtractionRepositoryProvider);
    _transcriptionRepository = ref.watch(transcriptionRepositoryProvider);
    initialize();
    return state;
  }

  final Logger _logger = Logger("HomeVm");
  late final AudioExtractionRepository _audioExtractionRepository;
  late final TranscriptionRepository _transcriptionRepository;

  Future<void> initialize() async {
    try {
      state = HomeVmState(initialized: false);
      await _transcriptionRepository.initialize();
      state = state.copyWith(initialized: true);
    } catch (e, stack) {
      _logger.severe("initialize(): Unable to initialize", e, stack);
    }
  }

  Future<void> pickFile({bool isAudio = false}) async {
    try {
      state = state.copyWith(selectedFile: null, pickingFile: true);
      final media = await _audioExtractionRepository.pickMedia(
        isAudio: isAudio,
      );
      state = state.copyWith(
        selectedFile: media,
        pickingFile: false,
        transcriptionSource: null,
        processingFile: false,
        extractingAudio: false,
      );
    } on MediaFileNotFound {
      _logger.info("User didn't select any files");
    } catch (e, stack) {
      state = state.copyWith(selectedFile: null, pickingFile: false);
      _handleError("pickAudio(): Unable to pick audio", e, stack);
    }
  }

  List<AudioStream>? get audioStreams =>
      state.transcriptionSource?.audioStreams;

  Future<void> createTranscriptionSource() async {
    try {
      state = state.copyWith(processingFile: true);
      final source = await _audioExtractionRepository.createTranscriptionSource(
        state.selectedFile!.name,
        state.selectedFile!.path!,
      );
      state = state.copyWith(
        transcriptionSource: source,
        processingFile: false,
      );
    } catch (e, stack) {
      _handleError(
        "createTranscriptionSource(): Unable to create TranscriptionSource",
        e,
        stack,
      );
    }
  }

  Future<void> beginAudioExtraction({int? streamIndex}) async {
    if (state.transcriptionSource == null) return;
    try {
      state = state.copyWith(processingFile: false, extractingAudio: true);
      final updated = await _audioExtractionRepository.extractAudio(
        state.transcriptionSource!,
        streamIndex: streamIndex,
      );
      // if (updated != null) {
      state = state.copyWith(transcriptionSource: updated);
      // }
      state = state.copyWith(extractingAudio: false);
    } catch (e, stack) {
      state = state.copyWith(processingFile: false);
      _handleError("beginAudioExtraction(): Unable to pick video", e, stack);
    }
  }

  Future<void> transcribe() async {
    if (state.transcriptionSource == null) return;
    try {
      state = state.copyWith(transcribing: true);
      _logger.info("Transcribing Source");
      await _transcriptionRepository.transcribe(state.transcriptionSource!);
      _logger.info("Transcribed Source");

      state = state.copyWith(transcribing: false);
    } catch (e, stack) {
      state = state.copyWith(transcribing: false);
      _handleError("transcribe(): Unable to pick transcribe", e, stack);
    }
  }

  void _handleError(String message, Object e, StackTrace stack) {
    _logger.severe(message, e, stack);
    if (e is Exception) {
      state = state.copyWith(exception: e);
      return;
    }
    throw e;
  }

  void clearException() => state = state.copyWith(exception: null);
}
