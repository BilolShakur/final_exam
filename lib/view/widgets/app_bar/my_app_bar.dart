import 'package:flutter/material.dart';

class InstagramAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset("assets/images/image.png", height: 40),
              Icon(Icons.keyboard_arrow_down, size: 20),
            ],
          ),
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.favorite_border, size: 28),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.send_outlined, size: 28),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.add_box_outlined, size: 28),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
