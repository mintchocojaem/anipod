enum CommunityCategory {
  all(displayName: '전체', value: 'all'),
  recent(displayName: '최신', value: 'recent'),
  volunteer(displayName: '봉사', value: 'volunteer'),
  review(displayName: '리뷰', value: 'review'),
  popular(displayName: '생활', value: 'popular');

  final String displayName;
  final String value;

  const CommunityCategory({
    required this.displayName,
    required this.value,
  });
}
