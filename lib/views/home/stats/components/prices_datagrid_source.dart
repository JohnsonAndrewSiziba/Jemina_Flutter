// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:jemina_capital/data/constants/theme_colors.dart';
import 'package:jemina_capital/models/price.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class PricesDataGridSource extends DataGridSource {
  /// Creates the team data source class with required details.
  PricesDataGridSource() {
    _prices = _getPrices();
    buildDataGridRows();
  }

  List<Price> _prices = <Price>[];

  List<DataGridRow> _dataGridRows = <DataGridRow>[];

  /// Building DataGridRows
  void buildDataGridRows() {
    _dataGridRows = _prices.map<DataGridRow>((Price price) {
      return DataGridRow(cells: <DataGridCell>[
        DataGridCell<String>(columnName: 'logo', value: price.logo),
        DataGridCell<String>(columnName: 'symbol', value: price.symbol),
        DataGridCell<String>(columnName: 'sector', value: price.sector),
        DataGridCell<double>(columnName: 'open', value: price.open),
        DataGridCell<double>(columnName: 'close', value: price.close),
        DataGridCell<double>(
            columnName: 'percentageChange', value: price.percentageChange),
        DataGridCell<double>(columnName: 'volume', value: price.volume),
        DataGridCell<double>(columnName: 'value', value: price.value),
        DataGridCell<double>(
            columnName: 'balanceSheet', value: price.balanceSheet),
        DataGridCell<double>(columnName: 'marketCap', value: price.marketCap),
        DataGridCell<double>(columnName: 'weight', value: price.weight),
      ]);
    }).toList();
  }

  // Overrides
  @override
  List<DataGridRow> get rows => _dataGridRows;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      color: Colors.white,
      cells: <Widget>[
        Container(
          height: 200.0,
          width: 200.0,
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Image.network(
            row.getCells()[0].value,
            height: 300.0,
            width: 300.0,
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            row.getCells()[1].value.toString(),
            softWrap: true,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.center,
          child: Text(
            row.getCells()[2].value.toString(),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.center,
          child: Text(
            row.getCells()[3].value.toString(),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.center,
          child: Text(
            row.getCells()[4].value.toString(),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.center,
          child: Text(
            row.getCells()[5].value.toString(),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.center,
          child: Text(
            row.getCells()[6].value.toString(),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.center,
          child: Text(
            row.getCells()[7].value.toString(),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.center,
          child: Text(
            row.getCells()[8].value.toString(),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.center,
          child: Text(
            row.getCells()[9].value.toString(),
            // overflow: TextOverflow.ellipsis,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.center,
          child: Text(
            row.getCells()[10].value.toString(),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  List<Price> _getPrices() {
    final List<Price> pricesList = <Price>[
      Price(
        1,
        "African Distillers",
        "AFD.ZW",
        "Consumer Stapples",
        12.0,
        12.0,
        0.00,
        12.0,
        12.0,
        12000.00,
        3245678.05,
        23.00,
        "https://jemina.capital/storage/company_logos/company-logo1642429062.png",
      ),
      Price(
        1,
        "African Distillers",
        "AFD.ZW",
        "Consumer Stapples",
        12.0,
        12.0,
        0.00,
        12.0,
        12.0,
        12000.00,
        3245678.05,
        23.00,
        "https://jemina.capital/storage/company_logos/company-logo1642429062.png",
      ),
      Price(
        1,
        "African Distillers",
        "AFD.ZW",
        "Consumer Stapples",
        12.0,
        12.0,
        0.00,
        12.0,
        12.0,
        12000.00,
        3245678.05,
        23.00,
        "https://jemina.capital/storage/company_logos/company-logo1642429062.png",
      ),
      Price(
        1,
        "African Distillers",
        "AFD.ZW",
        "Consumer Stapples",
        12.0,
        12.0,
        0.00,
        12.0,
        12.0,
        12000.00,
        3245678.05,
        23.00,
        "https://jemina.capital/storage/company_logos/company-logo1642429062.png",
      ),
      Price(
        1,
        "African Distillers",
        "AFD.ZW",
        "Consumer Stapples",
        12.0,
        12.0,
        0.00,
        12.0,
        12.0,
        12000.00,
        3245678.05,
        23.00,
        "https://jemina.capital/storage/company_logos/company-logo1642429062.png",
      ),
      Price(
        1,
        "African Distillers",
        "AFD.ZW",
        "Consumer Stapples",
        12.0,
        12.0,
        0.00,
        12.0,
        12.0,
        12000.00,
        3245678.05,
        23.00,
        "https://jemina.capital/storage/company_logos/company-logo1642429062.png",
      ),
    ];

    return pricesList;
  }
}
