import 'package:final_exam/models/story_data.dart';
import 'package:flutter/material.dart';

class StoryItem extends StatelessWidget {
  final StoryData story;

  const StoryItem({Key? key, required this.story}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      margin: EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: 66,
                height: 66,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: story.isViewed
                      ? null
                      : LinearGradient(
                          colors: [
                            Color(0xFFE91E63),
                            Color(0xFFFF9800),
                            Color(0xFFFFEB3B),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                  color: story.isViewed ? Colors.grey[300] : null,
                ),
                padding: EdgeInsets.all(2),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                    image: DecorationImage(
                      image: AssetImage(story.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              if (story.hasAddButton)
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: Icon(Icons.add, color: Colors.white, size: 12),
                  ),
                ),
            ],
          ),
          SizedBox(height: 4),
          Text(
            story.username,
            style: TextStyle(fontSize: 12, color: Colors.black87),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
