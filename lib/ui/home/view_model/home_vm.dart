import 'package:logging/logging.dart';
import 'package:polyglot/data/repositories/audio_extraction_repository.dart';
import 'package:polyglot/data/repositories_provider.dart';
import 'package:polyglot/ui/home/view_model/state/home_vm_state.dart';
import 'package:polyglot/utils/exceptions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_vm.g.dart';

@riverpod
class HomeVm extends _$HomeVm {
  @override
  HomeVmState build() {
    _audioExtractionRepository = ref.watch(audioExtractionRepository);
    initialize();
    return state;
  }

  final Logger _logger = Logger("HomeVm");
  late final AudioExtractionRepository _audioExtractionRepository;

  Future<void> initialize() async {
    try {
      state = HomeVmState(initialized: false);
      state = state.copyWith(initialized: true);
    } catch (e, stack) {
      _logger.severe("initialize(): Unable to initialize", e, stack);
    }
  }

  Future<void> pickFile({bool isAudio = false}) async {
    try {
      final media = await _audioExtractionRepository.pickMedia(
        isAudio: isAudio,
      );
      state = state.copyWith(
        selectedFile: media,
        transcriptionSource: null,
        processingFile: false,
      );
    } on MediaFileNotFound {
      _logger.info("User didn't select any files");
    } catch (e, stack) {
      _handleError("pickAudio(): Unable to pick audio", e, stack);
    }
  }

  Future<void> beginAudioExtraction() async {
    if (state.selectedFile == null) return;
    try {
      state = state.copyWith(processingFile: true);
      final source = await _audioExtractionRepository.extract(
        state.selectedFile!.path!,
      );
      state = state.copyWith(
        transcriptionSource: source,
        processingFile: false,
      );
    } catch (e, stack) {
      state = state.copyWith(processingFile: false);
      _handleError("beginAudioExtraction(): Unable to pick video", e, stack);
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
}
