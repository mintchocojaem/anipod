import 'package:json_annotation/json_annotation.dart';

@JsonEnum()
enum CrewCategoryModel {
  animal(displayName: '동물', value: 'ANIMAL'),
  volunteer(displayName: '봉사활동', value: 'VOLUNTEER'),
  friend(displayName: '동네친구', value: 'FRIEND'),
  exercise(displayName: '운동', value: 'EXERCISE'),
  hobby(displayName: '취미', value: 'HOBBY'),
  etc(displayName: '기타', value: 'ETC');

  final String displayName;
  final String value;

  const CrewCategoryModel({
    required this.displayName,
    required this.value,
  });
}

@JsonEnum()
enum CrewAgeLimitModel {
  anyone(displayName: '전체', value: 'ANYONE'),
  twenty(displayName: '20대', value: 'TWENTY'),
  thirty(displayName: '30대', value: 'THIRTY'),
  forty(displayName: '40대', value: 'FORTY'),
  fifty(displayName: '50대', value: 'FIFTY'),
  sixty(displayName: '60대', value: 'SIXTY');

  final String displayName;
  final String value;

  const CrewAgeLimitModel({
    required this.displayName,
    required this.value,
  });
}

@JsonEnum()
enum CrewMaxMemberCountModel {
  ten(displayName: '10명', value: 10),
  twenty(displayName: '20명', value: 20),
  thirty(displayName: '30명', value: 30),
  forty(displayName: '40명', value: 40),
  fifty(displayName: '50명', value: 50),
  hundred(displayName: '100명', value: 100);

  final String displayName;
  final int value;

  const CrewMaxMemberCountModel({
    required this.displayName,
    required this.value,
  });
}
