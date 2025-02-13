import 'dart:developer';

import 'package:agoris_admin/presentation/widgets/market_place/delete_item.dart';
import 'package:agoris_admin/presentation/widgets/market_place/suspend_item.dart';
import 'package:flutter/material.dart';

import 'package:agoris_admin/common/size_constants.dart';

import 'package:agoris_admin/presentation/theme/colors.dart';

import 'package:agoris_admin/presentation/widgets/common/metric_card.dart';
import 'package:agoris_admin/presentation/widgets/common/data_table.dart';
import 'package:agoris_admin/presentation/widgets/common/empty_table.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:data_table_2/data_table_2.dart';

class MarketPlace extends StatefulWidget {
  const MarketPlace({super.key});

  @override
  State<MarketPlace> createState() => _MarketPlaceState();
}

class _MarketPlaceState extends State<MarketPlace> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(Sizes.dimen_16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Metrics Section
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  MetricCard(
                     title: "Gross Market Value",
                     isCurrency: true,
                     value: "6.48b",
                     change: "-13%",
                     changeColor: Colors.red
                  ),

                  MetricCard(
                    title: "Items Listed",
                    isCurrency: false,
                    value: "3.92m",
                    change: "+5%",
                    changeColor: Colors.green
                  ),

                  MetricCard(
                    title: "Items Sold",
                    value: "97.34k",
                    isCurrency: false,
                    change: "+5%",
                    changeColor: Colors.green
                  ),

                  MetricCard(
                    title: "Sales Value",
                    isCurrency: true,
                    // value: "₦529m",
                    value: "529m",
                    change: "+11%",
                    changeColor: Colors.green
                  ),

                ],
              ),
              const SizedBox(height: Sizes.dimen_20),

              // Items List Table
              Flexible(
                fit: FlexFit.loose,
                child: AgorisDataTable(
                  title: "Items Listed",
                  subTitle: "Keep track of items listed by users",
                  numColumns: 7,
                  columnNames: const [
                    "Item Name",
                    "Category",
                    "Sub-Category",
                    "Seller Details",
                    "Rating/Reviews",
                    "Date Listed",
                    "Actions"
                  ],
                  emptyTableTitle: "There are no items to show",
                  emptyTableSubTitle: "When users list items for sale, they’ll be displayed here",
                  source: MarketPlaceDataTableSource(context: context),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

}

// class MarketPlaceTable extends StatelessWidget {
//
//   final String tableTitle;
//   final String tableSubTitle;
//
//   const MarketPlaceTable({
//     super.key,
//     required this.tableTitle,
//     required this.tableSubTitle
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
//               "Items Listed",
//               style: TextStyle(fontSize: Sizes.dimen_16, fontWeight: FontWeight.w600, color: AppColors.appBlack),
//             ),
//             const SizedBox(height: Sizes.dimen_8),
//
//             const Text(
//               "Keep track of items listed by users",
//               style: TextStyle(fontSize: Sizes.dimen_12, fontWeight: FontWeight.w400, color: Color(0xFF545959)),
//             ),
//
//             const SizedBox(height: Sizes.dimen_16),
//
//             Expanded(
//               child: PaginatedDataTable2(
//                 minWidth: Sizes.dimen_768,
//                 dividerThickness: Sizes.dimen_0,
//                 horizontalMargin: Sizes.dimen_12,
//                 columnSpacing: Sizes.dimen_12,
//                 dataRowHeight: Sizes.dimen_56,
//                 // showHeadingCheckBox: false,
//                 headingTextStyle: Theme.of(context).textTheme.titleMedium,
//                 headingRowColor: WidgetStateProperty.resolveWith((states) => AppColors.primaryColor),
//                 empty: const EmptyTable(
//                   title: "There are no items to show",
//                   subTitle: "When users list items for sale, they’ll be displayed here",
//                 ),
//                 headingRowDecoration: const BoxDecoration(
//                   borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(Sizes.dimen_16),
//                       topRight: Radius.circular(Sizes.dimen_16)
//                   ),
//                 ),
//                 rowsPerPage: 15,
//                 showFirstLastButtons: true,
//                 renderEmptyRowsInTheEnd: false,
//                 isVerticalScrollBarVisible: true,
//                 isHorizontalScrollBarVisible: true,
//                 columns: [
//                   DataColumn2(label: Text("Item Name", style: TextStyle(color: AppColors.offWhite),), size: ColumnSize.L),
//                   DataColumn(label: Text("Category", style: TextStyle(color: AppColors.offWhite),),),
//                   DataColumn(label: Text("Sub-Category", style: TextStyle(color: AppColors.offWhite),),),
//                   DataColumn(label: Text("Seller Details", style: TextStyle(color: AppColors.offWhite),)),
//                   DataColumn(label: Text("Rating/Reviews", style: TextStyle(color: AppColors.offWhite),),),
//                   DataColumn(label: Text("Date Listed", style: TextStyle(color: AppColors.offWhite),),),
//                   DataColumn(label: Text("Actions", style: TextStyle(color: AppColors.offWhite),),),
//                 ],
//                 source: MarketPlaceDataTableSource(context: context),
//
//                 // rows: List.generate(60, (index) {
//                 //   return DataRow(
//                 //     cells: [
//                 //       const DataCell(
//                 //         Row(
//                 //           children: [
//                 //             CircleAvatar(
//                 //               backgroundColor: Colors.black,
//                 //               child: Icon(Icons.image, color: Colors.white),
//                 //             ),
//                 //             SizedBox(width: Sizes.dimen_8),
//                 //             Text("Lorem Ipsum"),
//                 //           ],
//                 //         ),
//                 //       ),
//                 //
//                 //       const DataCell(Text("Lorem Ipsum")),
//                 //
//                 //       const DataCell(Text("Nord et Atrium")),
//                 //
//                 //       const DataCell(
//                 //         Row(
//                 //           children: [
//                 //             CircleAvatar(
//                 //               backgroundImage: AssetImage("assets/user.png"),
//                 //             ),
//                 //             SizedBox(width: Sizes.dimen_8),
//                 //             Text("John Doe"),
//                 //           ],
//                 //         ),
//                 //       ),
//                 //
//                 //       DataCell(
//                 //         Row(
//                 //           children: List.generate(
//                 //             5,
//                 //                 (starIndex) => const Icon(Icons.star, color: Colors.amber, size: Sizes.dimen_16),
//                 //           ),
//                 //         ),
//                 //       ),
//                 //       const DataCell(Text("20 Jan 2023")),
//                 //
//                 //       DataCell(
//                 //         Row(
//                 //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 //           crossAxisAlignment: CrossAxisAlignment.center,
//                 //           children: [
//                 //             IconButton(
//                 //               onPressed: (){},
//                 //               icon: const Icon(Icons.delete, color: Colors.red)
//                 //             ),
//                 //
//                 //             IconButton(
//                 //                 onPressed: (){},
//                 //                 icon: Icon(Icons.pause, color: AppColors.appBlack)
//                 //             ),
//                 //           ],
//                 //         )
//                 //       ),
//                 //     ],
//                 //   );
//                 // }),
//
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
// }

class MarketPlaceDataTableSource extends DataTableSource {

  final BuildContext context;
  MarketPlaceDataTableSource({required this.context});

  @override
  DataRow? getRow(int index) {
    return DataRow2(
      cells: [
        DataCell(
          Row(
            children: [
             const CircleAvatar(
                backgroundColor: Colors.black,
                child: Icon(Icons.image, color: Colors.white),
              ),
              const SizedBox(width: Sizes.dimen_8),
              Text("Item $index"),
            ],
          ),
        ),

        DataCell(Text("Category $index")),

        DataCell(Text("Sub Category $index")),

        const DataCell(
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.blue,
                child: Icon(Icons.image, color: Colors.white),
              ),
              SizedBox(width: Sizes.dimen_8),
              Text("John Doe"),
            ],
          ),
        ),

        DataCell(
          Row(
            children: List.generate(
              5,
                  (starIndex) => const Icon(Icons.star, color: Colors.amber, size: Sizes.dimen_16),
            ),
          ),
        ),
        const DataCell(Text("20 Jan 2023")),

        DataCell(
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: (){
                      showDialog(
                        context: context,
                        builder: (_) => const DeleteItemDialog()
                      );
                    },
                    icon: const Icon(Icons.delete, color: Colors.red)
                ),

                IconButton(
                    onPressed: (){
                      showDialog(
                          context: context,
                          builder: (_) => const SuspendItemDialog()
                      );
                    },
                    icon: Icon(Icons.pause, color: AppColors.appBlack)
                ),
              ],
            )
        ),
      ]
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => 60;

  @override
  int get selectedRowCount => 0;

}