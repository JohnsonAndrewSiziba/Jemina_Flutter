// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:jemina_capital/data/constants/theme_colors.dart';
import 'package:jemina_capital/views/home/stats/components/prices_datagrid_source.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class PricesDataTable extends StatefulWidget {
  PricesDataTable({Key? key}) : super(key: key);

  @override
  State<PricesDataTable> createState() => _PricesDataTableState();
}

class _PricesDataTableState extends State<PricesDataTable> {
  PricesDataGridSource teamDataGridSource = PricesDataGridSource();

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
          columnWidthMode: ColumnWidthMode.auto,
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
              allowSorting: true,
              columnName: 'sector',
              width: double.nan,
              label: Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Sector',
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
              columnName: 'close',
              label: const Center(
                child: Text(
                  'Close',
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
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
            GridColumn(
              columnName: 'value',
              label: const Center(
                child: Text(
                  'Value',
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            GridColumn(
              columnName: 'bal_sheet',
              label: const Center(
                child: Text(
                  'Bal. Sheet',
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            GridColumn(
              columnName: 'mkt_cap',
              label: const Center(
                child: Text(
                  'Mkt. Cap.',
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            GridColumn(
              columnName: 'weight',
              label: const Center(
                child: Text(
                  'Weight',
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
