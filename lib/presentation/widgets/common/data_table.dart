import 'package:flutter/material.dart';

import 'package:agoris_admin/common/size_constants.dart';

import 'package:agoris_admin/presentation/theme/colors.dart';

import 'package:agoris_admin/presentation/widgets/common/empty_table.dart';

import 'package:data_table_2/data_table_2.dart';

import 'package:flutter/material.dart';
import 'package:data_table_2/data_table_2.dart';

class AgorisDataTable extends StatelessWidget {

  final String title;
  final String emptyTableTitle;
  final String subTitle;
  final String emptyTableSubTitle;
  final int numColumns;
  final List<String> columnNames;
  final DataTableSource source;

  const AgorisDataTable({
    Key? key,
    required this.title,
    required this.emptyTableTitle,
    required this.subTitle,
    required this.emptyTableSubTitle,
    required this.numColumns,
    required this.columnNames,
    required this.source,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Sizes.dimen_16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: Sizes.dimen_20, fontWeight: FontWeight.bold)),
          const SizedBox(height: Sizes.dimen_8),
          Text(subTitle, style: const TextStyle(fontSize: Sizes.dimen_16, color: Colors.grey)),
          const SizedBox(height: Sizes.dimen_16),

          // Table
          Expanded(
            child: PaginatedDataTable2(
              minWidth: Sizes.dimen_768,
              dividerThickness: Sizes.dimen_0,
              horizontalMargin: Sizes.dimen_12,
              columnSpacing: Sizes.dimen_12,
              dataRowHeight: Sizes.dimen_56,
              headingTextStyle: Theme.of(context).textTheme.titleMedium,
              headingRowColor: WidgetStateProperty.resolveWith((states) => AppColors.primaryColor),
              empty: EmptyTable(
                title: emptyTableTitle,
                subTitle: emptyTableSubTitle,
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
              source: source,
            ),
          ),
        ],
      ),
    );
  }

}