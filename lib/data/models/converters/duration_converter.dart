import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

class DurationConverter extends JsonConverter<Duration, Map<String, dynamic>> {
  static Duration fromJSON(String json) {
    final parts = json.split(':');
    if (parts.length != 3) {
      throw const FormatException(
        "Invalid time format, expected 'hh:mm:ss.microseconds'",
      );
    }
    final secondsParts = parts[2].split('.');
    final hours = int.tryParse(parts[0]) ?? 0;
    final minutes = int.tryParse(parts[1]) ?? 0;
    final seconds = int.tryParse(secondsParts[0]) ?? 0;
    final microseconds = secondsParts.length > 1
        ? int.tryParse(secondsParts[1].padRight(6, '0')) ?? 0
        : 0;
    return Duration(
      hours: hours,
      minutes: minutes,
      seconds: seconds,
      microseconds: microseconds,
    );
  }

  static Duration fromFFmpegString(String ffmpegDuration) {
    final double seconds = double.tryParse(ffmpegDuration) ?? 0.0;

    final int microseconds = (seconds * 1000000).round();

    return Duration(microseconds: microseconds);
  }

  static String toJSON(Duration object) => object.toString();

  @override
  Duration fromJson(Map<String, dynamic> json) => fromJSON(jsonEncode(json));

  @override
  Map<String, dynamic> toJson(Duration object) =>
      jsonDecode(toJSON(object)) as Map<String, dynamic>;
}
