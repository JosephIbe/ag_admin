import 'dart:developer';

import 'package:agoris_admin/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

import 'package:agoris_admin/common/size_constants.dart';

import 'package:agoris_admin/presentation/widgets/common/metric_card.dart';
import 'package:agoris_admin/presentation/widgets/common/data_table.dart';
import 'package:agoris_admin/presentation/widgets/common/empty_table.dart';

import 'package:data_table_2/data_table_2.dart';

class Transactions extends StatefulWidget {
  const Transactions({super.key});

  @override
  State<Transactions> createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {

  late Size size;

  final columnNames = [
    "Transaction Id",
    "Ad Type",
    "Amount (₦)",
    "Status",
    "Reference",
  ];

  @override
  Widget build(BuildContext context) {

    size = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(Sizes.dimen_16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Metrics Section
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: Sizes.dimen_120,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MetricCard(title: "Total Ads Revenue", value: "N471m", change: "-13%", changeColor: Colors.red, isCurrency: true,),
                        MetricCard(title: "Today's Ad Revenue", value: "N2.8m", change: "+5%", changeColor: Colors.green, isCurrency: true,),
                        MetricCard(title: "Items Promoted", value: "3.93k", change: "+5%", changeColor: Colors.green, isCurrency: false,),
                        MetricCard(title: "Revenue Per Item", value: "N712", change: "+5%", changeColor: Colors.green, isCurrency: true,),
                      ],
                    ),
                  ),
                  const SizedBox(height: Sizes.dimen_20),

                  // Transactions List Table
                  Flexible(
                    fit: FlexFit.loose,
                    child: SizedBox(
                      width: size.width - Sizes.dimen_250,
                      child: PaginatedDataTable2(
                        minWidth: Sizes.dimen_400,
                        dividerThickness: Sizes.dimen_0,
                        horizontalMargin: Sizes.dimen_12,
                        columnSpacing: Sizes.dimen_12,
                        dataRowHeight: Sizes.dimen_56,
                        headingTextStyle: Theme.of(context).textTheme.titleMedium,
                        headingRowColor: WidgetStateProperty.resolveWith((states) => AppColors.primaryColor),
                        empty: const EmptyTable(
                          title: "Transaction History",
                          subTitle: "Keep track of user's ads spend",
                        ),
                        headingRowDecoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(Sizes.dimen_16),
                              topRight: Radius.circular(Sizes.dimen_16)
                          ),
                        ),
                        rowsPerPage: 15,
                        showFirstLastButtons: true,
                        renderEmptyRowsInTheEnd: false,
                        isVerticalScrollBarVisible: true,
                        isHorizontalScrollBarVisible: true,
                        columns: columnNames
                            .map((colName) => DataColumn(label: Text(colName, style: const TextStyle(color: Colors.white))))
                            .toList(),
                        source: TransactionsDataTableSource(),
                      ),

                      // child: AgorisDataTable(
                      //   title: "Transaction History",
                      //   subTitle: "Keep track of user's ads spend",
                      //   numColumns: 5,
                      //   columnNames: const [
                      //     "Transaction Id",
                      //     "Ad Type",
                      //     "Amount (₦)",
                      //     "Status",
                      //     "Reference",
                      //   ],
                      //   emptyTableTitle: "There are no items to show",
                      //   emptyTableSubTitle: "When users list items for sale, they’ll be displayed here",
                      //   source: TransactionsDataTableSource(),
                      // ),
                      // child: MarketPlaceTable(),

                    ),
                  )
                ],
              ),
            ),
            const SizedBox(width: Sizes.dimen_16,),

            // Activities List
            const ActivitiesList(),
          ],
        ),
      ),
    );

    // return SafeArea(
    //   child: Scaffold(
    //     body: SizedBox(
    //       width: size.width - Sizes.dimen_250,
    //       height: size.height,
    //       child: Padding(
    //         padding: const EdgeInsets.all(Sizes.dimen_16),
    //         child: Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           children: [
    //             SizedBox(
    //               width: size.width - Sizes.dimen_300,
    //               child: const Column(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [
    //                   // Metrics Section
    //                   // Row(
    //                   //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                   //   children: [
    //                   //
    //                   //     MetricCard(
    //                   //         title: "Total Ads Revenue",
    //                   //         isCurrency: true,
    //                   //         value: "471m",
    //                   //         change: "-13%",
    //                   //         changeColor: Colors.red
    //                   //     ),
    //                   //
    //                   //     MetricCard(
    //                   //         title: "Today's Ad Revenue",
    //                   //         isCurrency: true,
    //                   //         value: "3.92k",
    //                   //         change: "+5%",
    //                   //         changeColor: Colors.green
    //                   //     ),
    //                   //
    //                   //     MetricCard(
    //                   //         title: "Revenue per Item",
    //                   //         value: "500",
    //                   //         isCurrency: true,
    //                   //         change: "+5%",
    //                   //         changeColor: Colors.green
    //                   //     ),
    //                   //
    //                   //     MetricCard(
    //                   //         title: "Items Promoted",
    //                   //         isCurrency: false,
    //                   //         // value: "₦529m",
    //                   //         value: "0",
    //                   //         change: "-11%",
    //                   //         changeColor: Colors.red
    //                   //     ),
    //                   //
    //                   //   ],
    //                   // ),
    //                   SizedBox(height: Sizes.dimen_20),
    //
    //                   Transactions List Table
    //
    //                   Flexible(
    //                   fit: FlexFit.loose,
    //                   SizedBox(
    //                     width: size.width - Sizes.dimen_250,
    //                     child: PaginatedDataTable2(
    //                       minWidth: Sizes.dimen_400,
    //                       dividerThickness: Sizes.dimen_0,
    //                       horizontalMargin: Sizes.dimen_12,
    //                       columnSpacing: Sizes.dimen_12,
    //                       dataRowHeight: Sizes.dimen_56,
    //                       headingTextStyle: Theme.of(context).textTheme.titleMedium,
    //                       headingRowColor: WidgetStateProperty.resolveWith((states) => AppColors.primaryColor),
    //                       empty: const EmptyTable(
    //                         title: "Transaction History",
    //                         subTitle: "Keep track of user's ads spend",
    //                       ),
    //                       headingRowDecoration: const BoxDecoration(
    //                         borderRadius: BorderRadius.only(
    //                             topLeft: Radius.circular(Sizes.dimen_16),
    //                             topRight: Radius.circular(Sizes.dimen_16)
    //                         ),
    //                       ),
    //                       rowsPerPage: 15,
    //                       showFirstLastButtons: true,
    //                       renderEmptyRowsInTheEnd: false,
    //                       isVerticalScrollBarVisible: true,
    //                       isHorizontalScrollBarVisible: true,
    //                       columns: columnNames
    //                           .map((colName) => DataColumn(label: Text(colName, style: const TextStyle(color: Colors.white))))
    //                           .toList(),
    //                       source: TransactionsDataTableSource(),
    //                     ),
    //
    //                     // child: AgorisDataTable(
    //                     //   title: "Transaction History",
    //                     //   subTitle: "Keep track of user's ads spend",
    //                     //   numColumns: 5,
    //                     //   columnNames: const [
    //                     //     "Transaction Id",
    //                     //     "Ad Type",
    //                     //     "Amount (₦)",
    //                     //     "Status",
    //                     //     "Reference",
    //                     //   ],
    //                     //   emptyTableTitle: "There are no items to show",
    //                     //   emptyTableSubTitle: "When users list items for sale, they’ll be displayed here",
    //                     //   source: TransactionsDataTableSource(),
    //                     // ),
    //                     // child: MarketPlaceTable(),
    //
    //                   ),
    //
    //                 ],
    //               ),
    //             ),
    //             const SizedBox(width: Sizes.dimen_20,),
    //
    //             Material(
    //               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Sizes.dimen_10)),
    //               elevation: Sizes.dimen_2,
    //               color: AppColors.lightWhite,
    //               child: Container(
    //                 width: Sizes.dimen_280,
    //                 padding: const EdgeInsets.all(Sizes.dimen_16),
    //                 constraints: const BoxConstraints(
    //                   minHeight: Sizes.dimen_400,
    //                   maxHeight: Sizes.dimen_800
    //                 ),
    //                 decoration: BoxDecoration(
    //                   color: AppColors.lightWhite,
    //                   borderRadius: BorderRadius.circular(Sizes.dimen_10)
    //                 ),
    //                 child: Column(
    //                   children: [
    //                     Container(
    //                       padding: const EdgeInsets.all(Sizes.dimen_8),
    //                       decoration: BoxDecoration(
    //                         border: Border.fromBorderSide(BorderSide(color: AppColors.grey200, width: Sizes.dimen_1),)
    //                       ),
    //                       child: Text(
    //                         'Activities',
    //                         style: TextStyle(
    //                           color: AppColors.appBlack,
    //                           fontSize: Sizes.dimen_16,
    //                           fontWeight: FontWeight.w600
    //                         ),
    //                       ),
    //                     ),
    //                     const SizedBox(height: Sizes.dimen_10,),
    //
    //                     ListView.builder(
    //                       itemCount: 40,
    //                       shrinkWrap: true,
    //                       reverse: true,
    //                       scrollDirection: Axis.vertical,
    //                       itemBuilder: (context, index) => Column(
    //                         children: [
    //                           Text(
    //                             "",
    //                             style: TextStyle(
    //                               color: AppColors.appBlack,
    //                               fontWeight: FontWeight.w500,
    //                               fontSize: Sizes.dimen_14,
    //                             ),
    //                           ),
    //
    //                           Text(
    //                             "Purchased Weekly Ads",
    //                             style: TextStyle(
    //                               color: AppColors.primaryColor.withOpacity(.2),
    //                               fontWeight: FontWeight.w500,
    //                               fontSize: Sizes.dimen_12,
    //                             ),
    //                           ),
    //                         ],
    //                       ),
    //                     )
    //                   ],
    //                 )
    //               ),
    //             ),
    //           ],
    //         )
    //       ),
    //     ),
    //   ),
    // );

  }

}

class ActivitiesList extends StatelessWidget {

  const ActivitiesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Sizes.dimen_10)),
      elevation: Sizes.dimen_2,
      color: AppColors.lightWhite,
      child: Container(
        width: Sizes.dimen_220,
        padding: const EdgeInsets.all(Sizes.dimen_6),
        constraints: const BoxConstraints(
            minHeight: Sizes.dimen_400,
            maxHeight: Sizes.dimen_800
        ),
        decoration: BoxDecoration(
            color: AppColors.lightWhite,
            borderRadius: BorderRadius.circular(Sizes.dimen_10)
        ),
        margin: const EdgeInsets.only(right: Sizes.dimen_16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(Sizes.dimen_8),
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
              ),
              child: const Text(
                "Activities",
                style: TextStyle(fontSize: Sizes.dimen_16, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 10, // Replace with actual data count
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(backgroundColor: Colors.blue, radius: Sizes.dimen_16),
                    title: Text("User Name $index"),
                    subtitle: Text("Purchased Monthly Ads"),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TransactionsDataTableSource extends DataTableSource {

  @override
  DataRow? getRow(int index) {
    return DataRow2(
        onTap: (){
          log('clicked at transaction row:$index');
        },
        cells: [
          DataCell(
            Text("Transaction Id $index"),
          ),

          const DataCell(
            Text("Daily"),
          ),

          const DataCell(Text("500")),

          const DataCell(Text("Pending")),

          const DataCell(Text("0xFF2789189")),

        ]
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => 26;

  @override
  int get selectedRowCount => 0;

}