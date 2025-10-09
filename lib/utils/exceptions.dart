class StorageDirectoryNotAvailable implements Exception {
  final String path;
  StorageDirectoryNotAvailable(this.path);
  @override
  String toString() {
    return "Storage directory not available at $path Unable to continue";
  }
}
