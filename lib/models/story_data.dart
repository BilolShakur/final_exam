class StoryData {
  final String username;
  final String imageUrl;
  final bool hasAddButton;
  final bool isViewed;

  StoryData({
    required this.username,
    required this.imageUrl,
    this.hasAddButton = false,
    this.isViewed = false,
  });
}
