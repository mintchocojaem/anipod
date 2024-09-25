class CrewProfileModel {
  final String imageUrl;
  final String name;

  CrewProfileModel({
    required this.imageUrl,
    required this.name,
  });
}

class CommunityPostModel {
  final String name;
  final String title;
  final String content;
  final int commentCount;
  final int likeCount;
  final String imageUrl;
  final String time;

  CommunityPostModel({
    required this.name,
    required this.title,
    required this.content,
    required this.commentCount,
    required this.likeCount,
    required this.imageUrl,
    required this.time,
  });
}

class CommunityBoardModel {
  final List<CommunityPostModel> posts;
  final int currentPage;
  final int totalPages;
  final bool hasNext;

  CommunityBoardModel({
    required this.posts,
    required this.currentPage,
    required this.totalPages,
    required this.hasNext,
  });
}
