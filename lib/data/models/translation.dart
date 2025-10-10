import 'package:freezed_annotation/freezed_annotation.dart';

part 'translation.freezed.dart';
part 'translation.g.dart';

@freezed
abstract class Translation with _$Translation {
  const factory Translation({
    required int transcriptionId,
    required String langCode,
    required String language,
    required Map<String, dynamic> translatedData,
    required double size,
  }) = _Translation;
  factory Translation.fromJson(Map<String, dynamic> json) =>
      _$TranslationFromJson(json);
}
