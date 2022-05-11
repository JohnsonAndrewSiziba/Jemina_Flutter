class TradingCounterListItem {
  final int id;
  final String? name;
  final String? symbol;
  final String? logoPath;
  final String? listing;
  final String? averagePrice;
  final num percentageChange;
  final String? bestAsk;
  final String? askVolume;
  final String? bestBid;
  final String? bidVolume;

  TradingCounterListItem(
      this.id,
      this.name,
      this.symbol,
      this.logoPath,
      this.listing,
      this.averagePrice,
      this.percentageChange,
      this.bestAsk,
      this.askVolume,
      this.bestBid,
      this.bidVolume,
      );

  static List<TradingCounterListItem> jsonDecode(List<dynamic> jsonList) {
    return (jsonList).map((i) => TradingCounterListItem.fromJson(i)).toList();
  }

  factory TradingCounterListItem.fromJson(Map<String, dynamic> json) => TradingCounterListItem(
    json["id"],
    json["name"],
    json["symbol"],
    json["logo_path"],
    json["listing"],
    "22.05", // json["average_price"],
    22.05, // json["percentage_change"],
    "22.05", // json["best_ask"],
    "22.05", // json["ask_volume"],
    "22.05", // json["best_bid"],
    "22.05", // json["bid_volume"],
  );
}
