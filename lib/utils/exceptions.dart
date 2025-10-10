class StorageDirectoryNotAvailable implements Exception {
  @override
  String toString() => "Storage directory not available. Unable to continue";
}

class MediaFileNotFound implements Exception {
  @override
  String toString() => "Unable to locate media file. Please try again";
}
