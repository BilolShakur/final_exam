import 'package:flutter/material.dart';

class PostCaption extends StatelessWidget {
  final String username;
  final String caption;
  const PostCaption({Key? key, required this.username, required this.caption})
    : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: RichText(
        text: TextSpan(
          style: TextStyle(color: Colors.black, fontSize: 14),
          children: [
            TextSpan(
              text: username,
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            TextSpan(text: caption),
            TextSpan(
              text: 'more',
              style: TextStyle(color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }
}
