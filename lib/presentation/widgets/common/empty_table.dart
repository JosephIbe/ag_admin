import 'package:flutter/material.dart';

import 'package:agoris_admin/common/asset_constants.dart';
import 'package:agoris_admin/common/size_constants.dart';

import 'package:agoris_admin/presentation/theme/colors.dart';

import 'package:flutter_svg/flutter_svg.dart';

class EmptyTable extends StatelessWidget {

  final String title;
  final String subTitle;

  const EmptyTable({
    super.key,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: Sizes.dimen_300,
      color: AppColors.lightWhite,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(AssetConstants.noItems),
            const SizedBox(height: Sizes.dimen_20,),

            Text(
              title,
              style: TextStyle(
                fontSize: Sizes.dimen_16,
                fontWeight: FontWeight.w600,
                color: AppColors.appBlack
              ),
            ),
            const SizedBox(height: Sizes.dimen_10,),

            Text(
              subTitle,
              style: const TextStyle(
                fontSize: Sizes.dimen_14,
                fontWeight: FontWeight.normal,
                color: Color(0xFF545959)
              ),
            )
          ],
        ),
      ),
    );
  }

}