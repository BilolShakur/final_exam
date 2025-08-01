import 'package:final_exam/view/widgets/bottom_bar/bottom_bar_item.dart';
import 'package:flutter/material.dart';

class InstagramBottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.grey[300]!, width: 0.5)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BottomBarItem(icon: Icons.home, isSelected: true),
          BottomBarItem(icon: Icons.search),
          BottomBarItem(icon: Icons.video_collection_outlined),
          BottomBarItem(icon: Icons.shopping_bag_outlined),
          BottomBarItem(
            icon: Icons.person,
            isProfile: true,
            profileImage: 'assets/images/durant.png',
          ),
        ],
      ),
    );
  }
}
