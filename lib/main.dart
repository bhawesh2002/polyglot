import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

Future<void> main() async {
  Logger.root.onRecord.listen((record) {
    debugPrint(
        "${record.loggerName} : ${record.level} : ${record.time} <=> Message: ${record.message}${record.error != null ? "\nError: ${record.error}" : ""}${record.stackTrace != null ? "\nStackTrace: ${record.stackTrace}" : ""}");
  });
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
