import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:polyglot/routing/app_router.dart';

Future<void> main() async {
  Logger.root.onRecord.listen((record) {
    debugPrint(
        "${record.loggerName} : ${record.level} : ${record.time} <=> Message: ${record.message}${record.error != null ? "\nError: ${record.error}" : ""}${record.stackTrace != null ? "\nStackTrace: ${record.stackTrace}" : ""}");
  });
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ProviderScope(child: const MainApp()));
}

class MainApp extends ConsumerStatefulWidget {
  const MainApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainAppState();
}

class _MainAppState extends ConsumerState<MainApp> {
  @override
  Widget build(BuildContext context) {
    final router = ref.watch(appRouterProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
