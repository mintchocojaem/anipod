import 'package:json_annotation/json_annotation.dart';

@JsonEnum()
enum CommunityCategoryModel {
  all(displayName: '전체', value: 'ALL'),
  volunteer(displayName: '봉사', value: 'VOLUNTEER'),
  review(displayName: '리뷰', value: 'REVIEW'),
  life(displayName: '생활', value: 'LIFE'),
  question(displayName: '질문', value: 'QUESTION');

  final String displayName;
  final String value;

  const CommunityCategoryModel({
    required this.displayName,
    required this.value,
  });
}
