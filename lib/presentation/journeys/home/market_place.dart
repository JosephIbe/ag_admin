import 'package:flutter/material.dart';

import 'package:agoris_admin/common/size_constants.dart';

import 'package:agoris_admin/presentation/theme/colors.dart';

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Metrics Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildMetricCard("Gross Market Value", "₦6.48b", "-13%", Colors.red),
                  _buildMetricCard("Items Listed", "3.92m", "+5%", Colors.green),
                  _buildMetricCard("Items Sold", "97.34k", "+5%", Colors.green),
                  _buildMetricCard("Sales Value", "₦529m", "+11%", Colors.green),
                ],
              ),
              const SizedBox(height: Sizes.dimen_20),

              // Items Listed Header
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     const Text(
              //       "Items Listed",
              //       style: TextStyle(fontSize: Sizes.dimen_20, fontWeight: FontWeight.bold),
              //     ),
              //
              //     const Text(
              //       "Keep track of items listed by users.",
              //       style: TextStyle(fontSize: Sizes.dimen_16, color: Colors.grey),
              //     ),
              //     const SizedBox(height: Sizes.dimen_20),
              //
              //     // Search Bar
              //     TextField(
              //       decoration: InputDecoration(
              //         prefixIcon: const Icon(Icons.search),
              //         hintText: "Search item or seller name",
              //         border: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(Sizes.dimen_10),
              //         ),
              //       ),
              //     ),
              //     const SizedBox(height: Sizes.dimen_20),
              //   ],
              // ),

              const Text(
                "Items Listed",
                style: TextStyle(fontSize: Sizes.dimen_20, fontWeight: FontWeight.bold),
              ),

              const Text(
                "Keep track of items listed by users.",
                style: TextStyle(fontSize: Sizes.dimen_16, color: Colors.grey),
              ),
              const SizedBox(height: Sizes.dimen_20),

              // Items List Table
              Expanded(
                child: SingleChildScrollView(
                  child: DataTable(
                    // fixedTopRows: 1,
                    // decoration: BoxDecoration(
                    //   borderRadius: BorderRadius.circular(Sizes.dimen_10),
                    //   color: AppColors.offWhite,
                    // ),
                    columns: const [
                      DataColumn2(label: Text("Item Name"), ),
                      DataColumn(label: Text("Category"), ),
                      DataColumn(label: Text("Sub-Category")),
                      DataColumn(label: Text("Price (NGN)")),
                      DataColumn(label: Text("Negotiable")),
                      DataColumn(label: Text("Seller Details")),
                      DataColumn(label: Text("Seller Rating/Reviews")),
                      DataColumn(label: Text("Date Listed")),
                      DataColumn(label: Text("Action")),
                    ],
                    rows: List.generate(6, (index) {
                      return DataRow(
                        cells: [
                          DataCell(
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: Sizes.dimen_20,
                                  backgroundColor: AppColors.appBlack,
                                ),
                                const SizedBox(width: Sizes.dimen_10),
                                const Text("Lorem Ipsum"),
                              ],
                            )
                          ),
                          DataCell(Text("Category $index")),
                          DataCell(Text("Sub-category $index")),

                          DataCell(Text("120000")),
                          DataCell(Text("true")),

                          const DataCell(Text("John Doe")),

                          const DataCell(Row(
                            children: [
                              Icon(Icons.star, color: Colors.amber, size: Sizes.dimen_18),
                              SizedBox(width: Sizes.dimen_5),
                              Text("4.5 (93)"),
                            ],
                          )),
                          const DataCell(Text("22 Jan 2023")),

                          DataCell(
                            Row(
                              children: [
                                IconButton(
                                  onPressed: (){},
                                  icon: Icon(Icons.pause, color: AppColors.primaryColor.withOpacity(.5),),
                                ),

                                IconButton(
                                  onPressed: (){},
                                  icon: Icon(Icons.delete_forever_rounded, color: AppColors.primaryColor.withOpacity(.5),),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    }),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMetricCard(String title, String value, String change, Color changeColor) {
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
              const SizedBox(height: Sizes.dimen_10),
              Text(
                value,
                style: const TextStyle(fontSize: Sizes.dimen_24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: Sizes.dimen_5),
              Row(
                children: [
                  Icon(
                    change.startsWith('+') ? Icons.arrow_upward : Icons.arrow_downward,
                    color: changeColor,
                    size: Sizes.dimen_16,
                  ),
                  const SizedBox(width: Sizes.dimen_5),
                  Text(
                    change,
                    style: TextStyle(fontSize: Sizes.dimen_16, color: changeColor),
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