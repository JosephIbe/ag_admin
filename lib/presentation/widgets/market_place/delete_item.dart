import 'package:flutter/material.dart';

class DeleteItemDialog extends StatelessWidget {

  const DeleteItemDialog({super.key});

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
                  "Delete this item from Agoris? 🤔",
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
              "By deleting this item, it will be removed forever and the seller notified that the item violated the Terms of Service of Agoris.",
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
                ElevatedButton.icon(
                  onPressed: () {}, // Add delete functionality here
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green.shade900,
                  ),
                  icon: Icon(Icons.delete, size: 18),
                  label: Text("Delete"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

}
