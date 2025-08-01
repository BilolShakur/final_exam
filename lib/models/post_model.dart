class Post {
  final String id;
  final String username;
  final String caption;
  final String imageUrl;
  final String userProfile;
  final int likes;
  final DateTime createdAt;

  Post({
    required this.id,
    required this.username,
    required this.caption,
    required this.imageUrl,
    required this.userProfile,
    required this.likes,
    required this.createdAt,
  });


  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'caption': caption,
      'imageUrl': imageUrl,
      'userProfile': userProfile,
      'likes': likes,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  // For creating a Post from a Firebase Map
  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      id: map['id'],
      username: map['username'],
      caption: map['caption'],
      imageUrl: map['imageUrl'],
      userProfile: map['userProfile'],
      likes: map['likes'],
      createdAt: DateTime.parse(map['createdAt']),
    );
  }
}
