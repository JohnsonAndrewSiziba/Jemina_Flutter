// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:jemina_capital/data/constants/theme_colors.dart';
import 'package:jemina_capital/data/data.dart';
import 'package:jemina_capital/views/home/stats/components/team_datagrid_source.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class PricesDataTable extends StatefulWidget {
  PricesDataTable({Key? key}) : super(key: key);

  @override
  State<PricesDataTable> createState() => _PricesDataTableState();
}

class _PricesDataTableState extends State<PricesDataTable> {
  TeamDataGridSource teamDataGridSource = TeamDataGridSource();

  final GlobalKey<SfDataGridState> key = GlobalKey<SfDataGridState>();

  /// DataGridSource required for SfDataGrid to obtain the row data.
  Expanded _buildDataGridForMobile() {
    return Expanded(
      child: SfDataGridTheme(
        data: SfDataGridThemeData(
          selectionColor: techBlue,
          headerColor: Colors.white,
          gridLineColor: techBlue,
          gridLineStrokeWidth: 0.03,
          frozenPaneElevation: 0.0,
          frozenPaneLineColor: techBlue,
          frozenPaneLineWidth: 0.05,
        ),
        child: SfDataGrid(
          source: teamDataGridSource,
          frozenColumnsCount: 2,
          // columnWidthMode: ColumnWidthMode.auto,
          rowHeight: 50,
          columns: <GridColumn>[
            GridColumn(
              columnName: 'logo',
              width: 51,
              label: const SizedBox.shrink(),
            ),
            GridColumn(
              allowSorting: true,
              columnName: 'counter',
              width: double.nan,
              label: Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Symbol',
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            GridColumn(
              columnName: 'opening_price',
              label: const Center(
                child: Text(
                  'Open',
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            GridColumn(
                columnName: 'closing_price',
                label: const Center(
                  child: Text(
                    'Close',
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                )),
            GridColumn(
              columnName: 'percentage_change',
              label: const Center(
                child: Text(
                  '% Δ',
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            GridColumn(
              columnName: 'volume',
              label: const Center(
                child: Text(
                  'Volume',
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildDataGridForMobile();
  }
}
