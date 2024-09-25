// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'volunteer_post_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getVolunteerPostHash() => r'd3ebc5d1597c083f884bfb7c65e0291b9bdd6d98';

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

/// See also [getVolunteerPost].
@ProviderFor(getVolunteerPost)
const getVolunteerPostProvider = GetVolunteerPostFamily();

/// See also [getVolunteerPost].
class GetVolunteerPostFamily extends Family<AsyncValue<VolunteerPostModel>> {
  /// See also [getVolunteerPost].
  const GetVolunteerPostFamily();

  /// See also [getVolunteerPost].
  GetVolunteerPostProvider call({
    required int id,
  }) {
    return GetVolunteerPostProvider(
      id: id,
    );
  }

  @override
  GetVolunteerPostProvider getProviderOverride(
    covariant GetVolunteerPostProvider provider,
  ) {
    return call(
      id: provider.id,
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
  String? get name => r'getVolunteerPostProvider';
}

/// See also [getVolunteerPost].
class GetVolunteerPostProvider
    extends AutoDisposeFutureProvider<VolunteerPostModel> {
  /// See also [getVolunteerPost].
  GetVolunteerPostProvider({
    required int id,
  }) : this._internal(
          (ref) => getVolunteerPost(
            ref as GetVolunteerPostRef,
            id: id,
          ),
          from: getVolunteerPostProvider,
          name: r'getVolunteerPostProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getVolunteerPostHash,
          dependencies: GetVolunteerPostFamily._dependencies,
          allTransitiveDependencies:
              GetVolunteerPostFamily._allTransitiveDependencies,
          id: id,
        );

  GetVolunteerPostProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    FutureOr<VolunteerPostModel> Function(GetVolunteerPostRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetVolunteerPostProvider._internal(
        (ref) => create(ref as GetVolunteerPostRef),
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
  AutoDisposeFutureProviderElement<VolunteerPostModel> createElement() {
    return _GetVolunteerPostProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetVolunteerPostProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetVolunteerPostRef on AutoDisposeFutureProviderRef<VolunteerPostModel> {
  /// The parameter `id` of this provider.
  int get id;
}

class _GetVolunteerPostProviderElement
    extends AutoDisposeFutureProviderElement<VolunteerPostModel>
    with GetVolunteerPostRef {
  _GetVolunteerPostProviderElement(super.provider);

  @override
  int get id => (origin as GetVolunteerPostProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
