import 'package:flutter/material.dart';

import 'package:agoris_admin/common/size_constants.dart';

import 'package:agoris_admin/presentation/theme/colors.dart';

class MetricCard extends StatelessWidget {

  final String title;
  final String value;
  final String change;
  final Color changeColor;
  final bool isCurrency;

  const MetricCard({
    super.key,
    required this.title,
    required this.value,
    required this.isCurrency,
    required this.change,
    required this.changeColor
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Sizes.dimen_10)),
        elevation: Sizes.dimen_2,
        child: Padding(
          padding: const EdgeInsets.all(Sizes.dimen_16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: Sizes.dimen_16, color: Colors.grey),
              ),
              const SizedBox(height: Sizes.dimen_15),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Text(
                    isCurrency ? "₦ $value" : value,
                    style: TextStyle(fontSize: Sizes.dimen_24, fontWeight: FontWeight.w600, color: AppColors.appBlack),
                  ),

                  Container(
                    height: Sizes.dimen_32,
                    padding: const EdgeInsets.all(Sizes.dimen_8),
                    decoration: BoxDecoration(
                      color: changeColor.withOpacity(.2),
                      borderRadius: const BorderRadius.all(Radius.circular(Sizes.dimen_16)),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          change.startsWith('+') ? Icons.arrow_upward : Icons.arrow_downward,
                          color: changeColor,
                          size: Sizes.dimen_16,
                        ),
                        const SizedBox(width: Sizes.dimen_5),

                        Text(
                          change,
                          style: TextStyle(fontSize: Sizes.dimen_14, color: changeColor, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

}