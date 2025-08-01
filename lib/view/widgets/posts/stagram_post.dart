import 'package:flutter/material.dart';
import 'package:final_exam/models/post_model.dart';
import 'post_header.dart';
import 'post_image.dart';
import 'post_action.dart';
import 'post_likes.dart';
import 'post_caption.dart';
import 'post_coments.dart';

class InstagramPost extends StatelessWidget {
  final Post post;
  const InstagramPost({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PostHeader(username: post.username, userProfile: post.userProfile),
          PostImage(imageUrl: post.imageUrl),
          PostActions(),
          PostLikes(likes: post.likes),
          PostCaption(username: post.username, caption: post.caption),
          PostComments(), // you can add comment list here too
        ],
      ),
    );
  }
}
