import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:agoris_admin/common/size_constants.dart';

import 'package:agoris_admin/presentation/theme/colors.dart';

import 'package:agoris_admin/presentation/widgets/common/metric_card.dart';
import 'package:agoris_admin/presentation/widgets/common/data_table.dart';

import 'package:data_table_2/data_table_2.dart';

class Users extends StatefulWidget {
  const Users({super.key});

  @override
  State<Users> createState() => _UsersState();
}

class _UsersState extends State<Users> {

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
                  title: "Users",
                  subTitle: "Manage app users in one place",
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
                  emptyTableTitle: "There are no users to show",
                  emptyTableSubTitle: "When users register on the app, they’ll be displayed here",
                  source: UsersDataTableSource(),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

}

class UsersDataTableSource extends DataTableSource {

  @override
  DataRow? getRow(int index) {
    return DataRow2(
        onTap: (){
          log('clicked at row:$index');
        },
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
                      onPressed: (){},
                      icon: const Icon(Icons.delete, color: Colors.red)
                  ),

                  IconButton(
                      onPressed: (){},
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