enum VolunteerCategory {
  all(displayName: '전체', value: 'all'),
  recent(displayName: '최신', value: 'recent'),
  popular(displayName: '인기', value: 'popular');

  final String displayName;
  final String value;

  const VolunteerCategory({
    required this.displayName,
    required this.value,
  });
}
