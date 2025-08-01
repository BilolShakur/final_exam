import 'package:flutter/material.dart';

class PostLikes extends StatelessWidget {
  final int likes;
  const PostLikes({
    Key? key,
    required this.likes,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: Text(
        '100 likes',
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
      ),
    );
  }
}
