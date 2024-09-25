// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'volunteer_board_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$likeVolunteerPostHash() => r'c753f4674dae10e81af3e6dd149e971312172198';

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

/// See also [likeVolunteerPost].
@ProviderFor(likeVolunteerPost)
const likeVolunteerPostProvider = LikeVolunteerPostFamily();

/// See also [likeVolunteerPost].
class LikeVolunteerPostFamily extends Family<AsyncValue<bool>> {
  /// See also [likeVolunteerPost].
  const LikeVolunteerPostFamily();

  /// See also [likeVolunteerPost].
  LikeVolunteerPostProvider call({
    required int postId,
    required bool isLiked,
    CancelToken? cancelToken,
  }) {
    return LikeVolunteerPostProvider(
      postId: postId,
      isLiked: isLiked,
      cancelToken: cancelToken,
    );
  }

  @override
  LikeVolunteerPostProvider getProviderOverride(
    covariant LikeVolunteerPostProvider provider,
  ) {
    return call(
      postId: provider.postId,
      isLiked: provider.isLiked,
      cancelToken: provider.cancelToken,
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
  String? get name => r'likeVolunteerPostProvider';
}

/// See also [likeVolunteerPost].
class LikeVolunteerPostProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [likeVolunteerPost].
  LikeVolunteerPostProvider({
    required int postId,
    required bool isLiked,
    CancelToken? cancelToken,
  }) : this._internal(
          (ref) => likeVolunteerPost(
            ref as LikeVolunteerPostRef,
            postId: postId,
            isLiked: isLiked,
            cancelToken: cancelToken,
          ),
          from: likeVolunteerPostProvider,
          name: r'likeVolunteerPostProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$likeVolunteerPostHash,
          dependencies: LikeVolunteerPostFamily._dependencies,
          allTransitiveDependencies:
              LikeVolunteerPostFamily._allTransitiveDependencies,
          postId: postId,
          isLiked: isLiked,
          cancelToken: cancelToken,
        );

  LikeVolunteerPostProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.postId,
    required this.isLiked,
    required this.cancelToken,
  }) : super.internal();

  final int postId;
  final bool isLiked;
  final CancelToken? cancelToken;

  @override
  Override overrideWith(
    FutureOr<bool> Function(LikeVolunteerPostRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: LikeVolunteerPostProvider._internal(
        (ref) => create(ref as LikeVolunteerPostRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        postId: postId,
        isLiked: isLiked,
        cancelToken: cancelToken,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _LikeVolunteerPostProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LikeVolunteerPostProvider &&
        other.postId == postId &&
        other.isLiked == isLiked &&
        other.cancelToken == cancelToken;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, postId.hashCode);
    hash = _SystemHash.combine(hash, isLiked.hashCode);
    hash = _SystemHash.combine(hash, cancelToken.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin LikeVolunteerPostRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `postId` of this provider.
  int get postId;

  /// The parameter `isLiked` of this provider.
  bool get isLiked;

  /// The parameter `cancelToken` of this provider.
  CancelToken? get cancelToken;
}

class _LikeVolunteerPostProviderElement
    extends AutoDisposeFutureProviderElement<bool> with LikeVolunteerPostRef {
  _LikeVolunteerPostProviderElement(super.provider);

  @override
  int get postId => (origin as LikeVolunteerPostProvider).postId;
  @override
  bool get isLiked => (origin as LikeVolunteerPostProvider).isLiked;
  @override
  CancelToken? get cancelToken =>
      (origin as LikeVolunteerPostProvider).cancelToken;
}

String _$volunteerBoardHash() => r'4a3303efa9813958e4cb3b6118cdd6e31182136e';

/// See also [VolunteerBoard].
@ProviderFor(VolunteerBoard)
final volunteerBoardProvider = AutoDisposeAsyncNotifierProvider<VolunteerBoard,
    VolunteerBoardModel>.internal(
  VolunteerBoard.new,
  name: r'volunteerBoardProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$volunteerBoardHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$VolunteerBoard = AutoDisposeAsyncNotifier<VolunteerBoardModel>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
