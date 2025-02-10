import 'package:flutter/material.dart';

class SuspendItemDialog extends StatelessWidget {

  const SuspendItemDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Suspend this item from Agoris?",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                )
              ],
            ),
            SizedBox(height: 8),
            Text(
              "By suspending this item, users won’t be able to see this item on the marketplace or place enquiry on it, until you undo the action.",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Cancel"),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {}, // Add suspend functionality here
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green.shade900,
                  ),
                  child: Text("Proceed"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}