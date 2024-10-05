// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crew_wait_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$crewWaitListHash() => r'396061707353d3607c6d4d815ee2025842b0a363';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$CrewWaitList
    extends BuildlessAutoDisposeAsyncNotifier<CrewWaitListModel> {
  late final String crewId;

  FutureOr<CrewWaitListModel> build(
    String crewId,
  );
}

/// See also [CrewWaitList].
@ProviderFor(CrewWaitList)
const crewWaitListProvider = CrewWaitListFamily();

/// See also [CrewWaitList].
class CrewWaitListFamily extends Family<AsyncValue<CrewWaitListModel>> {
  /// See also [CrewWaitList].
  const CrewWaitListFamily();

  /// See also [CrewWaitList].
  CrewWaitListProvider call(
    String crewId,
  ) {
    return CrewWaitListProvider(
      crewId,
    );
  }

  @override
  CrewWaitListProvider getProviderOverride(
    covariant CrewWaitListProvider provider,
  ) {
    return call(
      provider.crewId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'crewWaitListProvider';
}

/// See also [CrewWaitList].
class CrewWaitListProvider extends AutoDisposeAsyncNotifierProviderImpl<
    CrewWaitList, CrewWaitListModel> {
  /// See also [CrewWaitList].
  CrewWaitListProvider(
    String crewId,
  ) : this._internal(
          () => CrewWaitList()..crewId = crewId,
          from: crewWaitListProvider,
          name: r'crewWaitListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$crewWaitListHash,
          dependencies: CrewWaitListFamily._dependencies,
          allTransitiveDependencies:
              CrewWaitListFamily._allTransitiveDependencies,
          crewId: crewId,
        );

  CrewWaitListProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.crewId,
  }) : super.internal();

  final String crewId;

  @override
  FutureOr<CrewWaitListModel> runNotifierBuild(
    covariant CrewWaitList notifier,
  ) {
    return notifier.build(
      crewId,
    );
  }

  @override
  Override overrideWith(CrewWaitList Function() create) {
    return ProviderOverride(
      origin: this,
      override: CrewWaitListProvider._internal(
        () => create()..crewId = crewId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        crewId: crewId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<CrewWaitList, CrewWaitListModel>
      createElement() {
    return _CrewWaitListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CrewWaitListProvider && other.crewId == crewId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, crewId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CrewWaitListRef
    on AutoDisposeAsyncNotifierProviderRef<CrewWaitListModel> {
  /// The parameter `crewId` of this provider.
  String get crewId;
}

class _CrewWaitListProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<CrewWaitList,
        CrewWaitListModel> with CrewWaitListRef {
  _CrewWaitListProviderElement(super.provider);

  @override
  String get crewId => (origin as CrewWaitListProvider).crewId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
