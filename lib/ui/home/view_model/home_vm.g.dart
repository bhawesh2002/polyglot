// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_vm.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(HomeVm)
const homeVmProvider = HomeVmProvider._();

final class HomeVmProvider extends $NotifierProvider<HomeVm, HomeVmState> {
  const HomeVmProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'homeVmProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$homeVmHash();

  @$internal
  @override
  HomeVm create() => HomeVm();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(HomeVmState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<HomeVmState>(value),
    );
  }
}

String _$homeVmHash() => r'3ae11751553f139ca4d090088037c7c591b6ac60';

abstract class _$HomeVm extends $Notifier<HomeVmState> {
  HomeVmState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<HomeVmState, HomeVmState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<HomeVmState, HomeVmState>,
              HomeVmState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
