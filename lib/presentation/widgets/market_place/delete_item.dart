import 'package:flutter/material.dart';

import 'package:agoris_admin/common/size_constants.dart';

import 'package:agoris_admin/presentation/theme/colors.dart';

class DeleteItemDialog extends StatelessWidget {

  const DeleteItemDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (MediaQuery.of(context).size.width * .5) - Sizes.dimen_250,
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Sizes.dimen_12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(Sizes.dimen_16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Delete this item from Agoris? 🤔",
                    style: TextStyle(fontSize: Sizes.dimen_16, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  )
                ],
              ),
              const SizedBox(height: Sizes.dimen_8),

              const Text(
                "By deleting this item, it will be removed forever and the seller notified that the item violated the Terms of Service of Agoris.",
                style: TextStyle(fontSize: Sizes.dimen_14, color: Colors.grey),
              ),
              const SizedBox(height: Sizes.dimen_16),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("Cancel"),
                  ),
                  const SizedBox(width: Sizes.dimen_8),

                  ElevatedButton.icon(
                    onPressed: () {}, // Add delete functionality here
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green.shade900,
                    ),
                    icon: const Icon(Icons.delete, size: Sizes.dimen_18),
                    label: Text("Delete", style: TextStyle(color: AppColors.lightWhite),),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

}
