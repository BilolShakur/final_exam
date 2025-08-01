import 'package:flutter/material.dart';

class BottomBarItem extends StatelessWidget {
  final IconData icon;
  final bool isSelected;
  final bool isProfile;
  final String? profileImage;

  const BottomBarItem({
    Key? key,
    required this.icon,
    this.isSelected = false,
    this.isProfile = false,
    this.profileImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isProfile && profileImage != null) {
      return Container(
        width: 28,
        height: 28,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: isSelected ? Colors.black : Colors.transparent,
            width: 1,
          ),
          image: DecorationImage(
            image: AssetImage(profileImage!),
            fit: BoxFit.cover,
          ),
        ),
      );
    }

    return Icon(
      icon,
      size: 28,
      color: isSelected ? Colors.black : Colors.black54,
    );
  }
}
