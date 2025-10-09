import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:polyglot/data/services/ffmpeg_service.dart';

final ffmpegServiceProvider = Provider((ref) => FfmpegService());
