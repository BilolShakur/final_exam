import 'package:bloc/bloc.dart';

import 'package:final_exam/view/bloc/image_posst_event.dart';
import 'package:final_exam/view/bloc/image_posst_state.dart';

import 'package:final_exam/view_model/posts_reposotory.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository repository;
  bool _isFetchingMore = false;

  PostBloc({required this.repository}) : super(PostInitial()) {
    on<FetchPosts>(_onFetchPosts);
    on<FetchMorePosts>(_onFetchMorePosts);
  }

  Future<void> _onFetchPosts(FetchPosts event, Emitter<PostState> emit) async {
    emit(PostLoading());
    try {
      final posts = await repository.fetchInitialPosts();
      emit(PostLoaded(posts, hasMore: repository.hasMore));
    } catch (e) {
      emit(PostError(e.toString()));
    }
  }

  Future<void> _onFetchMorePosts(
    FetchMorePosts event,
    Emitter<PostState> emit,
  ) async {
    if (!repository.hasMore || _isFetchingMore) return;
    _isFetchingMore = true;

    try {
      await repository.fetchMorePosts(); // appends to cache
      emit(PostLoaded(repository.cachedPosts, hasMore: repository.hasMore));
    } catch (e) {
      emit(PostError(e.toString()));
    } finally {
      _isFetchingMore = false;
    }
  }
}
