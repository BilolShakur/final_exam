import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:final_exam/view/widgets/app_bar/my_app_bar.dart';
import 'package:final_exam/view/widgets/bottom_bar/bottom_bar.dart';
import 'package:final_exam/view/widgets/posts/stagram_post.dart';
import 'package:final_exam/view/widgets/story/story_section.dart';
import 'package:final_exam/view_model/posts_reposotory.dart';
import 'package:final_exam/view/bloc/image_posst_bloc.dart';
import 'package:final_exam/view/bloc/image_posst_event.dart';
import 'package:final_exam/view/bloc/image_posst_state.dart';

class InstagramFeedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PostBloc(repository: PostRepository())..add(FetchPosts()),
      child: Scaffold(
        backgroundColor: Colors.grey[50],
        bottomNavigationBar: InstagramBottomBar(),
        body: SafeArea(
          child: SafeArea(
            child: BlocBuilder<PostBloc, PostState>(
              builder: (context, state) {
                if (state is PostLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is PostLoaded) {
                  return NotificationListener<ScrollNotification>(
                    onNotification: (scrollInfo) {
                      if (scrollInfo.metrics.pixels ==
                              scrollInfo.metrics.maxScrollExtent &&
                          state.hasMore) {
                        context.read<PostBloc>().add(FetchMorePosts());
                      }
                      return false;
                    },
                    child: CustomScrollView(
                      slivers: [
                        SliverToBoxAdapter(child: InstagramAppBar()),
                        SliverToBoxAdapter(child: StoriesSection()),
                        SliverList(
                          delegate: SliverChildBuilderDelegate((
                            context,
                            index,
                          ) {
                            if (index < state.posts.length) {
                              return InstagramPost(post: state.posts[index]);
                            } else {
                              return state.hasMore
                                  ? Center(
                                      child: Padding(
                                        padding: EdgeInsets.all(16),
                                        child: CircularProgressIndicator(),
                                      ),
                                    )
                                  : SizedBox.shrink();
                            }
                          }, childCount: state.posts.length + 1),
                        ),
                      ],
                    ),
                  );
                } else if (state is PostError) {
                  return Center(child: Text("Error: ${state.message}"));
                }
                return SizedBox.shrink();
              },
            ),
          ),
        ),
      ),
    );
  }
}
