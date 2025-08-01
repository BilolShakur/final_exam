import 'package:final_exam/view/widgets/action_button.dart';
import 'package:flutter/material.dart';

class PostActions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ActionButton(
                icon: Icons.favorite,
                color: Colors.red,
                onPressed: () {},
              ),
              SizedBox(width: 16),
              ActionButton(icon: Icons.chat_bubble_outline, onPressed: () {}),
              SizedBox(width: 16),
              ActionButton(icon: Icons.send_outlined, onPressed: () {}),
            ],
          ),
          ActionButton(icon: Icons.bookmark_border, onPressed: () {}),
        ],
      ),
    );
  }
}
