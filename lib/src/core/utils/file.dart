class File {
  final String id;
  final String url;
  final String originalName;
  final String mimeType;

  File({
    required this.id,
    required this.url,
    required this.originalName,
    required this.mimeType,
  });

  factory File.fromJson(Map<String, dynamic> json) => File(
        id: json['id'] as String,
        url: json['url'] as String,
        originalName: json['originalName'] as String,
        mimeType: json['mimeType'] as String,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'url': url,
        'originalName': originalName,
        'mimeType': mimeType,
      };
}
