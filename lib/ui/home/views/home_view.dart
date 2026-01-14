import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:polyglot/data/models/media_stream.dart';
import 'package:polyglot/data/models/transcription_source.dart';
import 'package:polyglot/ui/home/view_model/home_vm.dart';
import 'package:polyglot/ui/sidebar/app_sidebar.dart';
import 'package:polyglot/utils/constants.dart';
import 'package:polyglot/utils/extension.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final viewModel = ref.watch(homeVmProvider);
    final vmNotifier = ref.read(homeVmProvider.notifier);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (viewModel.exception != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: const Duration(seconds: 2),
            dismissDirection: DismissDirection.down,
            backgroundColor: Colors.redAccent.shade200,
            content: Text(
              "Error: ${viewModel.exception}",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
            ),
          ),
        );
        vmNotifier.clearException();
      }
    });

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Polyglot"),
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            if (_scaffoldKey.currentState?.isDrawerOpen == false) {
              _scaffoldKey.currentState?.openDrawer();
            }
          },
          icon: Icon(Icons.menu),
        ),
      ),
      drawer: AppSidebar(),
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
                  if (viewModel.selectedFile != null)
                    Text(
                      viewModel.selectedFile!.name,
                      softWrap: true,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  kVSpacing10,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (viewModel.selectedFile == null)
                        Text(
                          viewModel.pickingFile
                              ? "Selecting File"
                              : "Select a file",
                          softWrap: true,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      if (viewModel.pickingFile)
                        Padding(
                          padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
                          child: SizedBox.square(
                            dimension: 20,
                            child: CircularProgressIndicator(),
                          ),
                        ),
                    ],
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
                          if (vmNotifier.audioStreams != null &&
                              vmNotifier.audioStreams!.isNotEmpty) {
                            int? selectedIndex;
                            selectedIndex = await showDialog(
                              context: context,
                              builder: (context) => AudioStreamSelector(
                                audioStreams: vmNotifier.audioStreams!,
                              ),
                            );
                            if (selectedIndex != null) {
                              await vmNotifier.beginAudioExtraction(
                                streamIndex: selectedIndex,
                              );
                            }
                          }
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
                      child: Column(
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                viewModel.transcribing
                                    ? "Transcribing"
                                    : "Audio Extracted Successfully",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          TextButton(
                            onPressed: () async {
                              await vmNotifier.transcribe();
                            },
                            child: Row(
                              children: [
                                Text("Transcribe"),
                                if (viewModel.transcribing)
                                  CircularProgressIndicator(),
                              ],
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
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        leading: Icon(Icons.music_note),

                        title: Text(
                          "${audioStream.codecLong} (${audioStream.codec})",
                        ),
                        shape: index == selected
                            ? OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                  width: 2,
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
                      ),
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
