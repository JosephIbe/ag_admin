import 'package:flutter/material.dart';

import 'package:agoris_admin/common/size_constants.dart';

import 'package:agoris_admin/presentation/theme/colors.dart';

import 'package:data_table_2/data_table_2.dart';

import 'package:flutter/material.dart';
import 'package:data_table_2/data_table_2.dart';

class AgorisDataTable extends StatelessWidget {
  final String title;
  final String subTitle;
  final int numColumns;
  final List<String> columnNames;

  const AgorisDataTable({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.numColumns,
    required this.columnNames,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text(subTitle, style: const TextStyle(fontSize: 16, color: Colors.grey)),
          const SizedBox(height: 16),

          // Search Field
          TextField(
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              hintText: "Search...",
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            ),
          ),
          const SizedBox(height: 16),

          // Table
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: DataTable2(
                minWidth: 768,
                dividerThickness: 0,
                horizontalMargin: 12,
                columnSpacing: 12,
                dataRowHeight: 56,
                headingTextStyle: Theme.of(context).textTheme.titleMedium,
                headingRowColor: WidgetStateProperty.resolveWith((states) => Colors.blue),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                columns: columnNames
                    .map((colName) => DataColumn(label: Text(colName, style: const TextStyle(color: Colors.white))))
                    .toList(),
                rows: List.generate(60, (index) {
                  return DataRow(
                    cells: List.generate(numColumns, (i) => DataCell(Text("Sample Data $index"))),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


// class AgorisDataTable extends StatelessWidget {
//
//   final String title;
//   final String subTitle;
//   final int numColumns;
//   final List<String> columnNames;
//
//   const AgorisDataTable({
//     super.key,
//     required this.title,
//     required this.subTitle,
//     required this.numColumns,
//     required this.columnNames,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Padding(
//         padding: const EdgeInsets.all(Sizes.dimen_16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               title,
//               style: const TextStyle(fontSize: Sizes.dimen_20, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: Sizes.dimen_8),
//
//             Text(
//               subTitle,
//               style: const TextStyle(fontSize: Sizes.dimen_16, fontWeight: FontWeight.normal),
//             ),
//             const SizedBox(height: Sizes.dimen_8),
//
//             // TextField(
//             //   decoration: InputDecoration(
//             //     prefixIcon: const Icon(Icons.search),
//             //     hintText: "Search item or seller name",
//             //     border: OutlineInputBorder(borderRadius: BorderRadius.circular(Sizes.dimen_8)),
//             //   ),
//             // ),
//             // const SizedBox(height: Sizes.dimen_16),
//
//             Expanded(
//               child: DataTable2(
//                 minWidth: Sizes.dimen_768,
//                 dividerThickness: Sizes.dimen_0,
//                 horizontalMargin: Sizes.dimen_12,
//                 columnSpacing: Sizes.dimen_12,
//                 dataRowHeight: Sizes.dimen_56,
//                 showHeadingCheckBox: false,
//                 headingTextStyle: Theme.of(context).textTheme.titleMedium,
//                 headingRowColor: WidgetStateProperty.resolveWith((states) => AppColors.primaryColor),
//                 headingRowDecoration: const BoxDecoration(
//                   borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(Sizes.dimen_16),
//                       topRight: Radius.circular(Sizes.dimen_16)
//                   ),
//                 ),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(Sizes.dimen_10),
//                   color: AppColors.offWhite,
//                 ),
//                 // headingRowColor: MaterialStateProperty.all(Colors.grey.shade200),
//                 // columns: [
//                 //   DataColumn2(label: Text("Item Name", style: TextStyle(color: AppColors.offWhite),), size: ColumnSize.L),
//                 //   DataColumn(label: Text("Category", style: TextStyle(color: AppColors.offWhite),),),
//                 //   DataColumn(label: Text("Sub-Category", style: TextStyle(color: AppColors.offWhite),),),
//                 //   DataColumn(label: Text("Seller Details", style: TextStyle(color: AppColors.offWhite),)),
//                 //   DataColumn(label: Text("Rating/Reviews", style: TextStyle(color: AppColors.offWhite),),),
//                 //   DataColumn(label: Text("Date Listed", style: TextStyle(color: AppColors.offWhite),),),
//                 //   DataColumn(label: Text("Actions", style: TextStyle(color: AppColors.offWhite),),),
//                 // ],
//                 columns: List.generate(numColumns, (index){
//                   return index == 0 ?
//                     DataColumn2(label: Text(columnNames[index], style: TextStyle(color: AppColors.offWhite),), size: ColumnSize.L)
//                     : DataColumn(label: Text(columnNames[index], style: TextStyle(color: AppColors.offWhite),),);
//                 }),
//                 rows: List.generate(60, (index) {
//                   return DataRow(
//                     cells: [
//                       const DataCell(
//                         Row(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             CircleAvatar(
//                               backgroundColor: Colors.black,
//                               child: Icon(Icons.image, color: Colors.white),
//                             ),
//                             SizedBox(width: Sizes.dimen_8),
//                             Text("Lorem Ipsum"),
//                           ],
//                         ),
//                       ),
//
//                       const DataCell(Text("Lorem Ipsum")),
//
//                       const DataCell(Text("Nord et Atrium")),
//
//                       const DataCell(
//                         Row(
//                           children: [
//                             CircleAvatar(
//                               backgroundImage: AssetImage("assets/user.png"),
//                             ),
//                             SizedBox(width: Sizes.dimen_8),
//                             Text("John Doe"),
//                           ],
//                         ),
//                       ),
//
//                       DataCell(
//                         Row(
//                           children: List.generate(
//                             5,
//                                 (starIndex) => const Icon(Icons.star, color: Colors.amber, size: Sizes.dimen_16),
//                           ),
//                         ),
//                       ),
//                       const DataCell(Text("20 Jan 2023")),
//                       const DataCell(Icon(Icons.delete, color: Colors.red)),
//                     ],
//                   );
//                 }),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
// }