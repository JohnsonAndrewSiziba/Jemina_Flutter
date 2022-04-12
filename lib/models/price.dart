import 'package:intl/intl.dart';

class Price {
  Price(
    this.id,
    this.name,
    this.symbol,
    this.date,
    this.sector,
    this.open,
    this.close,
    this.percentageChange,
    this.change,
    this.volume,
    this.value,
    this.balanceSheet,
    this.marketCap,
    this.weight,
    this.logo,
    this.listedOn,
    this.direction,
  );

  final num id;

  final String name;

  final String symbol;

  final String date;

  final String? sector;

  final String open;

  final String close;

  final String percentageChange;

  final String change;

  final String volume;

  final String value;

  final String balanceSheet;

  final String marketCap;

  final String weight;

  final String? logo;

  final String listedOn;

  final String direction;

  static List<Price> jsonDecode(List<dynamic> jsonList) {
    return (jsonList as List).map((i) => Price.fromJson(i)).toList();
  }

  factory Price.fromJson(Map<String, dynamic> json) => Price(
    json["id"],
    json["name"],
    json["symbol"],
    DateFormat('yyyy-MM-dd').format(DateTime.parse(json["date"])),
    json["sector"],
    json["open"],
    json["close"],
    json["percentage_change"],
    json["change"],
    json["volume"],
    json["value"],
    json["balance_sheet"],
    json["market_cap"],
    json["weight"],
    json["logo_path"],
    json["listed_on"],
    json["direction"],
  );

  @override
  String toString(){
    return "$name: $date - $close";
  }

}
