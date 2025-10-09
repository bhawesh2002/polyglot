import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:polyglot/data/services/ffmpeg_service.dart';
import 'package:polyglot/data/services/storage_service.dart';

final ffmpegServiceProvider = Provider((ref) => FfmpegService());
final storageServiceProvider = Provider((ref) => StorageService());
