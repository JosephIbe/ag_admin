import 'package:flutter/material.dart';

import 'package:agoris_admin/common/asset_constants.dart';
import 'package:agoris_admin/common/size_constants.dart';

import 'package:agoris_admin/presentation/theme/colors.dart';

import 'package:flutter_svg/flutter_svg.dart';

class EmptyState extends StatelessWidget {

  final String title;
  const EmptyState({
    super.key,
    required this.title
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // SvgPicture.asset(AssetConstants.noItems),
        const SizedBox(height: Sizes.dimen_10,),

        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.subTitleColor,
            fontWeight: FontWeight.w400,
            fontSize: Sizes.dimen_12
          ),
        )
      ],
    );
  }
}
