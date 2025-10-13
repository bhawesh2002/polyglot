import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:polyglot/data/models/transcription.dart';
import 'package:polyglot/data/models/transcription_source.dart';

part 'transcriptions_view_vm_state.freezed.dart';

@freezed
abstract class TranscriptionsViewVmState with _$TranscriptionsViewVmState {
  const factory TranscriptionsViewVmState({
    @Default(false) bool initialized,
    @Default([]) List<Transcription> transcriptions,
    @Default([]) List<TranscriptionSource> orphanSources,
    int? activeTranscriptionSrcIndex,
    Exception? exception,
  }) = _TranscriptionsViewVmState;
}
