class VolunteerGuideModel {
  final String content;

  VolunteerGuideModel({
    required this.content,
  });
}

class VolunteerPostModel {
  final int id;
  final String title;
  final String organization;
  final String region;
  final String registrationDate;
  final String imageUrl;
  final bool isLiked;
  final String duration;

  VolunteerPostModel({
    required this.id,
    required this.title,
    required this.organization,
    required this.region,
    required this.registrationDate,
    required this.imageUrl,
    required this.isLiked,
    required this.duration,
  });
}

class VolunteerBoardModel {
  final List<VolunteerPostModel> contents;
  final int page;
  final int size;
  final int totalPages;
  final int totalElements;
  final bool hasNext;

  VolunteerBoardModel({
    required this.contents,
    required this.page,
    required this.size,
    required this.totalPages,
    required this.totalElements,
    required this.hasNext,
  });
}
