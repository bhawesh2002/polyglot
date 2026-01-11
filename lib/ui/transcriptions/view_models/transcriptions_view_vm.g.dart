// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transcriptions_view_vm.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TranscriptionsViewVm)
const transcriptionsViewVmProvider = TranscriptionsViewVmProvider._();

final class TranscriptionsViewVmProvider
    extends $NotifierProvider<TranscriptionsViewVm, TranscriptionsViewVmState> {
  const TranscriptionsViewVmProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'transcriptionsViewVmProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$transcriptionsViewVmHash();

  @$internal
  @override
  TranscriptionsViewVm create() => TranscriptionsViewVm();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TranscriptionsViewVmState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TranscriptionsViewVmState>(value),
    );
  }
}

String _$transcriptionsViewVmHash() =>
    r'b7553ee4b446dbc37c7a0f92803071e793cff952';

abstract class _$TranscriptionsViewVm
    extends $Notifier<TranscriptionsViewVmState> {
  TranscriptionsViewVmState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<TranscriptionsViewVmState, TranscriptionsViewVmState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<TranscriptionsViewVmState, TranscriptionsViewVmState>,
              TranscriptionsViewVmState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
