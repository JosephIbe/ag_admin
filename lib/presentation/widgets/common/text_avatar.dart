import 'package:flutter/material.dart';

import 'package:agoris_admin/common/size_constants.dart';

import 'package:agoris_admin/presentation/theme/colors.dart';

class TextAvatar extends StatelessWidget {

  final String firstName;
  final String lastName;

  const TextAvatar({super.key, required this.firstName, required this.lastName});

  @override
  Widget build(BuildContext context) {
    String initials = '${firstName[0]}${lastName[0]}'.toUpperCase();
    return Container(
      width: Sizes.dimen_50, // Adjust size as needed
      height: Sizes.dimen_50, // Adjust size as needed
      decoration: BoxDecoration(
        color: AppColors.primaryColor, // Background color
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          initials,
          style: const TextStyle(
            color: Colors.white, // Text color
            fontWeight: FontWeight.bold,
            fontSize: Sizes.dimen_12,
          ),
        ),
      ),
    );
  }

}