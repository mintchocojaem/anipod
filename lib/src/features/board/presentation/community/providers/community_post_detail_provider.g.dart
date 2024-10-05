// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community_post_detail_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$communityPostDetailHash() =>
    r'de4d810cacbeda0ffad30a40dd7a5f52c041c2f9';

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

abstract class _$CommunityPostDetail
    extends BuildlessAutoDisposeAsyncNotifier<CommunityPostDetailState> {
  late final String postId;

  FutureOr<CommunityPostDetailState> build(
    String postId,
  );
}

/// See also [CommunityPostDetail].
@ProviderFor(CommunityPostDetail)
const communityPostDetailProvider = CommunityPostDetailFamily();

/// See also [CommunityPostDetail].
class CommunityPostDetailFamily
    extends Family<AsyncValue<CommunityPostDetailState>> {
  /// See also [CommunityPostDetail].
  const CommunityPostDetailFamily();

  /// See also [CommunityPostDetail].
  CommunityPostDetailProvider call(
    String postId,
  ) {
    return CommunityPostDetailProvider(
      postId,
    );
  }

  @override
  CommunityPostDetailProvider getProviderOverride(
    covariant CommunityPostDetailProvider provider,
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
  String? get name => r'communityPostDetailProvider';
}

/// See also [CommunityPostDetail].
class CommunityPostDetailProvider extends AutoDisposeAsyncNotifierProviderImpl<
    CommunityPostDetail, CommunityPostDetailState> {
  /// See also [CommunityPostDetail].
  CommunityPostDetailProvider(
    String postId,
  ) : this._internal(
          () => CommunityPostDetail()..postId = postId,
          from: communityPostDetailProvider,
          name: r'communityPostDetailProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$communityPostDetailHash,
          dependencies: CommunityPostDetailFamily._dependencies,
          allTransitiveDependencies:
              CommunityPostDetailFamily._allTransitiveDependencies,
          postId: postId,
        );

  CommunityPostDetailProvider._internal(
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
  FutureOr<CommunityPostDetailState> runNotifierBuild(
    covariant CommunityPostDetail notifier,
  ) {
    return notifier.build(
      postId,
    );
  }

  @override
  Override overrideWith(CommunityPostDetail Function() create) {
    return ProviderOverride(
      origin: this,
      override: CommunityPostDetailProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<CommunityPostDetail,
      CommunityPostDetailState> createElement() {
    return _CommunityPostDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CommunityPostDetailProvider && other.postId == postId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, postId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CommunityPostDetailRef
    on AutoDisposeAsyncNotifierProviderRef<CommunityPostDetailState> {
  /// The parameter `postId` of this provider.
  String get postId;
}

class _CommunityPostDetailProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<CommunityPostDetail,
        CommunityPostDetailState> with CommunityPostDetailRef {
  _CommunityPostDetailProviderElement(super.provider);

  @override
  String get postId => (origin as CommunityPostDetailProvider).postId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
