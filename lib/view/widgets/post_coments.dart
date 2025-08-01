import 'package:flutter/material.dart';

class PostComments extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: Text(
        'View all 16 comments',
        style: TextStyle(color: Colors.grey[600], fontSize: 14),
      ),
    );
  }
}
