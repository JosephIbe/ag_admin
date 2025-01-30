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

              // Items List Table
              const Flexible(
                child: MarketPlaceTable(),
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

class MarketPlaceTable extends StatelessWidget {
  const MarketPlaceTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(Sizes.dimen_16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Items Listed",
              style: TextStyle(fontSize: Sizes.dimen_20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: Sizes.dimen_8),

            TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: "Search item or seller name",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(Sizes.dimen_8)),
              ),
            ),
            const SizedBox(height: Sizes.dimen_16),

            Expanded(
              child: DataTable2(
                minWidth: Sizes.dimen_768,
                dividerThickness: Sizes.dimen_0,
                horizontalMargin: Sizes.dimen_12,
                columnSpacing: Sizes.dimen_12,
                dataRowHeight: Sizes.dimen_56,
                showHeadingCheckBox: false,
                headingTextStyle: Theme.of(context).textTheme.titleMedium,
                headingRowColor: WidgetStateProperty.resolveWith((states) => AppColors.primaryColor),
                headingRowDecoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Sizes.dimen_16),
                      topRight: Radius.circular(Sizes.dimen_16)
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Sizes.dimen_10),
                  color: AppColors.offWhite,
                ),
                // headingRowColor: MaterialStateProperty.all(Colors.grey.shade200),
                columns: [
                  DataColumn2(label: Text("Item Name", style: TextStyle(color: AppColors.offWhite),), size: ColumnSize.L),
                  DataColumn(label: Text("Category", style: TextStyle(color: AppColors.offWhite),),),
                  DataColumn(label: Text("Sub-Category", style: TextStyle(color: AppColors.offWhite),),),
                  DataColumn(label: Text("Seller Details", style: TextStyle(color: AppColors.offWhite),)),
                  DataColumn(label: Text("Rating/Reviews", style: TextStyle(color: AppColors.offWhite),),),
                  DataColumn(label: Text("Date Listed", style: TextStyle(color: AppColors.offWhite),),),
                  DataColumn(label: Text("Actions", style: TextStyle(color: AppColors.offWhite),),),
                ],
                rows: List.generate(60, (index) {
                  return DataRow(
                    cells: [
                      DataCell(
                        Row(
                          children: [
                            const CircleAvatar(
                              backgroundColor: Colors.black,
                              child: Icon(Icons.image, color: Colors.white),
                            ),
                            const SizedBox(width: Sizes.dimen_8),
                            const Text("Lorem Ipsum"),
                          ],
                        ),
                      ),
                      const DataCell(Text("Lorem Ipsum")),
                      const DataCell(Text("Nord et Atrium")),
                      DataCell(
                        Row(
                          children: [
                            const CircleAvatar(
                              backgroundImage: AssetImage("assets/user.png"),
                            ),
                            const SizedBox(width: Sizes.dimen_8),
                            const Text("John Doe"),
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
                      DataCell(Text("20 Jan 2023")),
                      const DataCell(Icon(Icons.delete, color: Colors.red)),
                    ],
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
