import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:polyglot/ui/transcriptions/view_models/transcriptions_view_vm.dart';
import 'package:polyglot/utils/extension.dart';

class TranscriptionsView extends ConsumerStatefulWidget {
  const TranscriptionsView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TranscriptionsViewState();
}

class _TranscriptionsViewState extends ConsumerState<TranscriptionsView> {
  @override
  Widget build(BuildContext context) {
    final viewModel = ref.watch(transcriptionsViewVmProvider);
    final vmNotifier = ref.read(transcriptionsViewVmProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text("Transcriptions"),
        bottom: TabBar(
          tabs: [
            Tab(text: "Transcriptions"),
            Tab(text: "Orphaned Sources"),
          ],
        ),
      ),
      body: Padding(
        padding: context.devicePadding + EdgeInsets.symmetric(vertical: 12),
        child: DefaultTabController(
          length: viewModel.orphanSources.isNotEmpty ? 2 : 1,
          initialIndex: 0,
          child: !viewModel.initialized
              ? Center(child: CircularProgressIndicator())
              : Column(
                  children: [
                    Expanded(
                      child: TabBarView(
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            itemCount: viewModel.transcriptions.length,

                            itemBuilder: (context, index) {
                              final transcription =
                                  viewModel.transcriptions[index];
                              return ListTile(
                                title: Text(transcription.name),
                                subtitle: Text(transcription.source.name),
                              );
                            },
                          ),
                          ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            itemCount: viewModel.orphanSources.length,
                            itemBuilder: (context, index) {
                              final source = viewModel.orphanSources[index];
                              return Dismissible(
                                direction: DismissDirection.endToStart,
                                key: Key(source.id),
                                onDismissed: (direction) {
                                  source.deleteMe();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('${source.name} deleted'),
                                    ),
                                  );
                                },
                                child: ListTile(
                                  title: Text(source.name),
                                  subtitle: Text(source.path),
                                  leading: Icon(Icons.music_note),
                                  trailing:
                                      viewModel.activeTranscriptionSrcIndex ==
                                          index
                                      ? CircularProgressIndicator()
                                      : IconButton(
                                          onPressed: () {
                                            vmNotifier.transcribe(source);
                                          },
                                          icon: Icon(Icons.transcribe),
                                        ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
