import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:final_exam/models/post_model.dart';

class PostRepository {
  final String _baseUrl =
      'https://finalexam-7d89d-default-rtdb.firebaseio.com/posts.json';

  final int _limit = 4;
  int _currentPage = 1;
  bool _hasMore = true;
  final List<Post> _cachedPosts = [];

  /// Fetch first page
  Future<List<Post>> fetchInitialPosts() async {
    _currentPage = 1;
    _hasMore = true;
    _cachedPosts.clear();
    return await _fetchPosts(_currentPage);
  }

  /// Fetch next page
  Future<List<Post>> fetchMorePosts() async {
    if (!_hasMore) return [];
    _currentPage++;
    return await _fetchPosts(_currentPage);
  }

  /// Simulates pagination by slicing the full list
  Future<List<Post>> _fetchPosts(int page) async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      if (data == null || data is! Map<String, dynamic>) {
        _hasMore = false;
        return [];
      }

      final List<Post> allPosts =
          data.entries.map((entry) => Post.fromMap(entry.value)).toList()..sort(
            (a, b) => b.createdAt.compareTo(a.createdAt),
          ); // Newest first

      final paginated = allPosts
          .skip((page - 1) * _limit)
          .take(_limit)
          .toList();

      _hasMore = paginated.length == _limit;
      _cachedPosts.addAll(paginated);

      return paginated;
    } else {
      throw Exception("Failed to fetch posts: ${response.statusCode}");
    }
  }

  /// Check if more posts can be loaded
  bool get hasMore => _hasMore;

  /// Read-only cached posts
  List<Post> get cachedPosts => List.unmodifiable(_cachedPosts);
}
