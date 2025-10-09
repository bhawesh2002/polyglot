class StorageDirectoryNotAvailable implements Exception {
  @override
  String toString() {
    return "Storage directory not available. Unable to continue";
  }
}
