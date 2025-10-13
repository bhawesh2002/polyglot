import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';
import 'package:polyglot/data/models/hive/hive_utils.dart';
import 'package:polyglot/data/models/transcription.dart';
import 'package:polyglot/data/models/transcription_source.dart';
import 'package:polyglot/data/repositories/transcription_repository.dart';
import 'package:polyglot/data/repositories_provider.dart';
import 'package:polyglot/ui/transcriptions/view_models/state/transcriptions_view_vm_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'transcriptions_view_vm.g.dart';

@riverpod
class TranscriptionsViewVm extends _$TranscriptionsViewVm {
  @override
  TranscriptionsViewVmState build() {
    _transcriptionRepository = ref.watch(transcriptionRepositoryProvider);
    _transcriptionSourcesListener =
        HiveUtils.getBoxListener<TranscriptionSource>();
    setupListeners();
    initialize();
    return state;
  }

  final Logger _logger = Logger("TranscriptionsViewVmState");

  late final TranscriptionRepository _transcriptionRepository;

  late final ValueListenable? _transcriptionSourcesListener;
  late final ValueListenable? _transcriptionsListener;

  void setupListeners() {
    _transcriptionsListener = HiveUtils.getBoxListener<Transcription>();
    _transcriptionSourcesListener?.addListener(
      transcriptionSourcesListenerClbk,
    );
    _transcriptionsListener?.addListener(transcriptionsListenerClbk);
    ref.onDispose(() {
      _transcriptionSourcesListener?.removeListener(
        transcriptionSourcesListenerClbk,
      );
      _transcriptionsListener?.removeListener(transcriptionsListenerClbk);
    });
  }

  Future<void> initialize() async {
    try {
      state = TranscriptionsViewVmState(initialized: false);
      await _transcriptionRepository.initialize();
      transcriptionSourcesListenerClbk();
      transcriptionsListenerClbk();
      state = state.copyWith(initialized: true);
    } catch (e, stack) {
      _handleError("initialize(): Unable to initialize", e, stack);
    }
  }

  void transcriptionsListenerClbk() => state = state.copyWith(
    transcriptions: HiveUtils.transcriptionBox.values.toList(),
  );

  void transcriptionSourcesListenerClbk() => state = state.copyWith(
    orphanSources: HiveUtils.transcriptionSourceBox.values
        .where((e) => e.transctiptionId == null)
        .toList(),
  );

  void transcribe(TranscriptionSource source) async {
    if (state.activeTranscriptionSrcIndex != null) return;
    try {
      state = state.copyWith(
        activeTranscriptionSrcIndex: state.orphanSources.indexOf(source),
      );
      await _transcriptionRepository.transcribe(source);
      state = state.copyWith(activeTranscriptionSrcIndex: null);
    } catch (e, stack) {
      state = state.copyWith(activeTranscriptionSrcIndex: null);

      _handleError("transcribe(): error while transcribing", e, stack);
    }
  }

  Future<bool> deleteTranscriptionSource(TranscriptionSource source) async {
    if (state.activeTranscriptionSrcIndex != null) return false;
    try {
      state = state.copyWith(
        activeTranscriptionSrcIndex: state.orphanSources.indexOf(source),
      );
      await source.deleteMe();
      state = state.copyWith(activeTranscriptionSrcIndex: null);
    } catch (e, stack) {
      state = state.copyWith(activeTranscriptionSrcIndex: null);

      _handleError("transcribe(): error while transcribing", e, stack);
    }
    return true;
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
