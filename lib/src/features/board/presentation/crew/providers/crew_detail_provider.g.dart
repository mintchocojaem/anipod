// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crew_detail_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$crewDetailHash() => r'17d50a1dd9082905c4d4378bbefaa4a0d336e4b2';

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

abstract class _$CrewDetail
    extends BuildlessAutoDisposeAsyncNotifier<CrewDetailModel> {
  late final String id;

  FutureOr<CrewDetailModel> build(
    String id,
  );
}

/// See also [CrewDetail].
@ProviderFor(CrewDetail)
const crewDetailProvider = CrewDetailFamily();

/// See also [CrewDetail].
class CrewDetailFamily extends Family<AsyncValue<CrewDetailModel>> {
  /// See also [CrewDetail].
  const CrewDetailFamily();

  /// See also [CrewDetail].
  CrewDetailProvider call(
    String id,
  ) {
    return CrewDetailProvider(
      id,
    );
  }

  @override
  CrewDetailProvider getProviderOverride(
    covariant CrewDetailProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'crewDetailProvider';
}

/// See also [CrewDetail].
class CrewDetailProvider
    extends AutoDisposeAsyncNotifierProviderImpl<CrewDetail, CrewDetailModel> {
  /// See also [CrewDetail].
  CrewDetailProvider(
    String id,
  ) : this._internal(
          () => CrewDetail()..id = id,
          from: crewDetailProvider,
          name: r'crewDetailProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$crewDetailHash,
          dependencies: CrewDetailFamily._dependencies,
          allTransitiveDependencies:
              CrewDetailFamily._allTransitiveDependencies,
          id: id,
        );

  CrewDetailProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  FutureOr<CrewDetailModel> runNotifierBuild(
    covariant CrewDetail notifier,
  ) {
    return notifier.build(
      id,
    );
  }

  @override
  Override overrideWith(CrewDetail Function() create) {
    return ProviderOverride(
      origin: this,
      override: CrewDetailProvider._internal(
        () => create()..id = id,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<CrewDetail, CrewDetailModel>
      createElement() {
    return _CrewDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CrewDetailProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CrewDetailRef on AutoDisposeAsyncNotifierProviderRef<CrewDetailModel> {
  /// The parameter `id` of this provider.
  String get id;
}

class _CrewDetailProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<CrewDetail, CrewDetailModel>
    with CrewDetailRef {
  _CrewDetailProviderElement(super.provider);

  @override
  String get id => (origin as CrewDetailProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
