import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:logging/logging.dart';
import 'package:polyglot/data/models/hive/hive_registrar.g.dart';
import 'package:polyglot/data/models/hive/hive_utils.dart';
import 'package:polyglot/routing/app_router.dart';
import 'dart:developer' as developer;

Future<void> main() async {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    if (record.level == Level.FINE ||
        record.level == Level.FINEST ||
        record.level == Level.FINER) {
      developer.log(
        "log:= ${record.loggerName} : ${record.level} : ${record.time} <=> Message: ${record.message}${record.error != null ? "\nError: ${record.error}" : ""}${record.stackTrace != null ? "\nStackTrace: ${record.stackTrace}" : ""}",
      );
    } else {
      debugPrint(
        "log:= ${record.loggerName} : ${record.level} : ${record.time} <=> Message: ${record.message}${record.error != null ? "\nError: ${record.error}" : ""}${record.stackTrace != null ? "\nStackTrace: ${record.stackTrace}" : ""}",
      );
    }
  });
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapters();
  await HiveUtils.openBoxes();
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
      theme: ThemeData(fontFamily: 'Typold'),
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
