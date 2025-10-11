import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:polyglot/data/models/media_stream.dart';
import 'package:polyglot/data/models/transcription_source.dart';
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
        padding:
            context.devicePadding +
            EdgeInsets.symmetric(horizontal: 18).copyWith(top: 18),
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
                          await vmNotifier.createTranscriptionSource();
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Convert",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              if (viewModel.processingFile)
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 18.0,
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
                  if (viewModel.transcriptionSource != null &&
                      !viewModel.transcriptionSource!.isAudioExtracted)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 18.0),
                      child: TextButton(
                        onPressed: () async {
                          int? selectedIndex;

                          if (vmNotifier.audioStreams != null &&
                              vmNotifier.audioStreams!.isNotEmpty) {
                            selectedIndex = await showDialog(
                              context: context,
                              builder: (context) => AudioStreamSelector(
                                audioStreams: vmNotifier.audioStreams!,
                              ),
                            );
                          }
                          await vmNotifier.beginAudioExtraction(
                            streamIndex: selectedIndex,
                          );
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
                              if (viewModel.extractingAudio)
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 18.0,
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
                  if (viewModel.transcriptionSource != null &&
                      viewModel.transcriptionSource!.isAudioExtracted)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Audio Extracted Successfully",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          if (viewModel.extractingAudio)
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 18.0,
                              ),
                              child: SizedBox.square(
                                dimension: 20,
                                child: CircularProgressIndicator(),
                              ),
                            ),
                        ],
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
                                onTap: () async {
                                  await Clipboard.setData(
                                    ClipboardData(text: val.toString()),
                                  );
                                  setState(() {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        duration: const Duration(seconds: 1),
                                        backgroundColor:
                                            Colors.greenAccent.shade200,
                                        content: Text(
                                          "$key copied to clipboard",
                                        ),
                                      ),
                                    );
                                  });
                                },
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

class AudioStreamSelector extends StatefulWidget {
  final List<AudioStream> audioStreams;
  const AudioStreamSelector({super.key, required this.audioStreams});

  @override
  State<AudioStreamSelector> createState() => _AudioStreamSelectorState();
}

class _AudioStreamSelectorState extends State<AudioStreamSelector> {
  List<AudioStream> get audioStreams => widget.audioStreams;
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: SimpleDialog(
        title: Text("Choose audio stream"),
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsetsGeometry.symmetric(
                vertical: 12,
                horizontal: 18,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ...List.generate(audioStreams.length, (index) {
                    final audioStream = audioStreams[index];
                    return ListTile(
                      leading: Icon(Icons.music_note),
                      title: Text(
                        "${audioStream.codecLong} (${audioStream.codec})",
                      ),
                      shape: index == selected
                          ? OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                width: 1,
                                color: Colors.blueAccent,
                              ),
                            )
                          : null,
                      subtitle: Text(
                        "Bitrate: ${audioStream.bitrate} Channels: ${audioStream.channels}\n${audioStream.tags!.values.toList()}",
                      ),
                      isThreeLine: true,
                      onTap: () {
                        setState(() {
                          selected = index;
                        });
                      },
                    );
                  }),
                ],
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context, selected);
            },
            child: Text("Confirm"),
          ),
        ],
      ),
    );
  }
}
