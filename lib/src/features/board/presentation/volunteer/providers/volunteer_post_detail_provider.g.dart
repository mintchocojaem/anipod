// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'volunteer_post_detail_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$volunteerPostDetailHash() =>
    r'9852d79e6761dca13835026912e3d482bd5c1062';

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

abstract class _$VolunteerPostDetail
    extends BuildlessAutoDisposeAsyncNotifier<VolunteerPostDetailModel> {
  late final String postId;

  FutureOr<VolunteerPostDetailModel> build(
    String postId,
  );
}

/// See also [VolunteerPostDetail].
@ProviderFor(VolunteerPostDetail)
const volunteerPostDetailProvider = VolunteerPostDetailFamily();

/// See also [VolunteerPostDetail].
class VolunteerPostDetailFamily
    extends Family<AsyncValue<VolunteerPostDetailModel>> {
  /// See also [VolunteerPostDetail].
  const VolunteerPostDetailFamily();

  /// See also [VolunteerPostDetail].
  VolunteerPostDetailProvider call(
    String postId,
  ) {
    return VolunteerPostDetailProvider(
      postId,
    );
  }

  @override
  VolunteerPostDetailProvider getProviderOverride(
    covariant VolunteerPostDetailProvider provider,
  ) {
    return call(
      provider.postId,
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
  String? get name => r'volunteerPostDetailProvider';
}

/// See also [VolunteerPostDetail].
class VolunteerPostDetailProvider extends AutoDisposeAsyncNotifierProviderImpl<
    VolunteerPostDetail, VolunteerPostDetailModel> {
  /// See also [VolunteerPostDetail].
  VolunteerPostDetailProvider(
    String postId,
  ) : this._internal(
          () => VolunteerPostDetail()..postId = postId,
          from: volunteerPostDetailProvider,
          name: r'volunteerPostDetailProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$volunteerPostDetailHash,
          dependencies: VolunteerPostDetailFamily._dependencies,
          allTransitiveDependencies:
              VolunteerPostDetailFamily._allTransitiveDependencies,
          postId: postId,
        );

  VolunteerPostDetailProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.postId,
  }) : super.internal();

  final String postId;

  @override
  FutureOr<VolunteerPostDetailModel> runNotifierBuild(
    covariant VolunteerPostDetail notifier,
  ) {
    return notifier.build(
      postId,
    );
  }

  @override
  Override overrideWith(VolunteerPostDetail Function() create) {
    return ProviderOverride(
      origin: this,
      override: VolunteerPostDetailProvider._internal(
        () => create()..postId = postId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        postId: postId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<VolunteerPostDetail,
      VolunteerPostDetailModel> createElement() {
    return _VolunteerPostDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is VolunteerPostDetailProvider && other.postId == postId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, postId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin VolunteerPostDetailRef
    on AutoDisposeAsyncNotifierProviderRef<VolunteerPostDetailModel> {
  /// The parameter `postId` of this provider.
  String get postId;
}

class _VolunteerPostDetailProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<VolunteerPostDetail,
        VolunteerPostDetailModel> with VolunteerPostDetailRef {
  _VolunteerPostDetailProviderElement(super.provider);

  @override
  String get postId => (origin as VolunteerPostDetailProvider).postId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
