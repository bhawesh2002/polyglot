import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:polyglot/data/repositories/storage_repository.dart';
import 'package:polyglot/data/services_provider.dart';

final storageRepositoryProvier = Provider(
  (ref) => StorageRepository(
    storageService: ref.watch(storageServiceProvider),
  ),
);
