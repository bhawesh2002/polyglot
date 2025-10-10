import 'dart:typed_data';

import "package:file_picker/file_picker.dart";
import 'package:logging/logging.dart';

class MediaPickerService {
  final Logger _logger = Logger("MediaPickerService");

  Future<PlatformFile?> pickFile() async {
    try {
      final FilePickerResult? result = await FilePicker.platform.pickFiles(
        withReadStream: true,
        onFileLoading: (status) {},
        dialogTitle: "Pick a file",
      );
      if (result != null) {
        final file = result.files.first;
        return file;
      }
    } catch (e, stack) {
      _logger.severe("pickFile(): Error while picking file", e, stack);
      rethrow;
    }
    return null;
  }

  Future<PlatformFile?> pickAudioFile() async {
    try {
      final FilePickerResult? result = await FilePicker.platform.pickFiles(
        withReadStream: true,
        type: FileType.audio,
        onFileLoading: (status) {},
        dialogTitle: "Pick audio file",
      );
      if (result != null) {
        final file = result.files.first;
        return file;
      }
    } catch (e, stack) {
      _logger.severe(
        "pickAudioFile(): Error while picking audio file",
        e,
        stack,
      );
      rethrow;
    }
    return null;
  }

  Future<PlatformFile?> pickVideoFile() async {
    try {
      final FilePickerResult? result = await FilePicker.platform.pickFiles(
        withReadStream: true,
        type: FileType.video,
        onFileLoading: (status) {},
        dialogTitle: "Pick video file",
      );
      if (result != null) {
        final file = result.files.first;
        return file;
      }
    } catch (e, stack) {
      _logger.severe(
        "pickVideoFile(): Error while picking video file",
        e,
        stack,
      );
      rethrow;
    }
    return null;
  }

  Future<String?> saveFile(Uint8List fileData, String fileName) async {
    try {
      final path = await FilePicker.platform.saveFile(
        fileName: fileName,
        bytes: fileData,
      );
      return path;
    } catch (e, stack) {
      _logger.severe("saveFile(): Error while saving file", e, stack);
      rethrow;
    }
  }

  Future<String?> pickAFolder() async {
    try {
      final path = await FilePicker.platform.getDirectoryPath(
        dialogTitle: "Select folder to store files in",
      );
      return path;
    } catch (e, stack) {
      _logger.severe("saveFile(): Error while saving file", e, stack);
      rethrow;
    }
  }
}
