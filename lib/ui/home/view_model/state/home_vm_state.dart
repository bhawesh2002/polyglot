import 'package:file_picker/file_picker.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:polyglot/data/models/transcription_source.dart';

part 'home_vm_state.freezed.dart';

@freezed
abstract class HomeVmState with _$HomeVmState {
  factory HomeVmState({
    @Default(false) bool initialized,
    PlatformFile? selectedFile,
    TranscriptionSource? transcriptionSource,
    @Default(false) bool pickingFile,
    @Default(false) bool processingFile,
    @Default(false) bool extractingAudio,
    @Default(false) bool transcribing,
    Exception? exception,
  }) = _HomeVmState;
}
