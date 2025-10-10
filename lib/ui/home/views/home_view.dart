import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:polyglot/ui/home/view_model/home_vm.dart';
import 'package:polyglot/utils/constants.dart';
import 'package:polyglot/utils/extension.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  @override
  Widget build(BuildContext context) {
    final viewModel = ref.watch(homeVmProvider);
    final vmNotifier = ref.read(homeVmProvider.notifier);

    return Scaffold(
      body: Padding(
        padding: context.devicePadding + EdgeInsets.symmetric(horizontal: 18),
        child: !viewModel.initialized
            ? CircularProgressIndicator()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        onPressed: () async {
                          await vmNotifier.pickFile(isAudio: true);
                        },
                        padding: EdgeInsets.all(18),
                        iconSize: 40,
                        icon: Icon(Icons.music_note),
                      ),
                      IconButton(
                        onPressed: () async {
                          await vmNotifier.pickFile();
                        },
                        padding: EdgeInsets.all(18),

                        iconSize: 40,
                        icon: Icon(Icons.movie),
                      ),
                    ],
                  ),
                  kVSpacing20,
                  Text(
                    viewModel.selectedFile != null
                        ? viewModel.selectedFile!.name
                        : "Select a file",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                  ),

                  if (viewModel.selectedFile != null &&
                      viewModel.transcriptionSource == null)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 18.0),
                      child: TextButton(
                        onPressed: () async {
                          await vmNotifier.beginAudioExtraction();
                        },

                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Begin Extraction",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              if (viewModel.processingFile)
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0,
                                  ),
                                  child: SizedBox.square(
                                    dimension: 20,
                                    child: CircularProgressIndicator(),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  if (viewModel.transcriptionSource != null)
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: List.generate(
                            viewModel.transcriptionSource!.toJson().length,
                            (index) {
                              final src = viewModel.transcriptionSource!
                                  .toJson();
                              final key = src.keys.toList()[index];
                              final val = src[key];

                              return ListTile(
                                title: Text(key),
                                subtitle: Text(val.toString()),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                ],
              ),
      ),
    );
  }
}
