import 'package:final_exam/models/story_data.dart';
import 'package:final_exam/view/screens/page_view.dart';
import 'package:final_exam/view/widgets/story/story_item.dart';
import 'package:flutter/material.dart';

class StoriesSection extends StatelessWidget {
  final List<StoryData> stories = [
    StoryData(
      username: 'Ruffles',
      imageUrl: 'assets/images/profile.png',
      hasAddButton: true,
      isViewed: true,
    ),
    StoryData(
      username: 'sabanok...',
      imageUrl: 'assets/images/profile.png',
      hasAddButton: false,
      isViewed: false,
    ),
    StoryData(
      username: 'blue_bouy',
      imageUrl: 'assets/images/profile.png',
      hasAddButton: false,
      isViewed: false,
    ),
    StoryData(
      username: 'waggles',
      imageUrl: 'assets/images/profile.png',
      hasAddButton: false,
      isViewed: false,
    ),
    StoryData(
      username: 'steve.lo',
      imageUrl: 'assets/images/profile.png',
      hasAddButton: false,
      isViewed: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      padding: EdgeInsets.symmetric(vertical: 8),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 8),
        itemCount: stories.length,
        itemBuilder: (context, index) {
          return StoryItem(story: stories[index]);
        },
      ),
    );
  }
}
