import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:final_exam/models/post_model.dart';

class PostRepository {
  final String _baseUrl =
      'https://finalexam-7d89d-default-rtdb.firebaseio.com/posts.json';

  final int _limit = 3;
  int _currentPage = 1;
  bool _hasMore = true;
  final List<Post> _cachedPosts = [];

  /// Loads the first page of posts
  Future<List<Post>> fetchInitialPosts() async {
    _currentPage = 1;
    _hasMore = true;
    _cachedPosts.clear();
    return await _fetchPosts(_currentPage);
  }


  Future<List<Post>> fetchMorePosts() async {
    if (!_hasMore) return [];
    _currentPage++;
    return await _fetchPosts(_currentPage);
  }


  Future<List<Post>> _fetchPosts(int page) async {

    await Future.delayed(const Duration(seconds: 1));

    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      if (data == null || data is! Map<String, dynamic>) {
        _hasMore = false;
        return [];
      }

      final List<Post> allPosts =
          data.entries.map((entry) => Post.fromMap(entry.value)).toList()
            ..sort((a, b) => b.createdAt.compareTo(a.createdAt));

      final int start = (page - 1) * _limit;
      final int end = start + _limit;

      if (start >= allPosts.length) {
        _hasMore = false;
        return [];
      }

      final paginated = allPosts.sublist(
        start,
        end > allPosts.length ? allPosts.length : end,
      );

      _hasMore = paginated.length == _limit;
      _cachedPosts.addAll(paginated);

      return paginated;
    } else {
      throw Exception("Failed to fetch posts: ${response.statusCode}");
    }
  }

  bool get hasMore => _hasMore;
  List<Post> get cachedPosts => List.unmodifiable(_cachedPosts);
}
