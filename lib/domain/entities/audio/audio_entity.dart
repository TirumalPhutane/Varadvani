class AudioEntity {
  AudioEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.file,
    required this.contentType,
    required this.thumbnail,
    required this.duration,
    required this.category,
    required this.subcategory,
    required this.createdAt,
    required this.updatedAt,
  });

  AudioEntity.empty();

  String id = '';
  String title = '';
  String description = '';
  String file = '';
  String contentType = '';
  String thumbnail = '';
  int duration = 0;
  String category = '';
  String subcategory = '';
  String createdAt = '';
  String updatedAt = '';
}
