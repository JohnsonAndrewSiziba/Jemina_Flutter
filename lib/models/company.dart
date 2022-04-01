class Company {
  final int id;
  final String? name;
  final String? symbol;
  final String? isinNo;
  final String? yearEnd;
  final String? founded;
  final String? dateListed;
  final String? balanceSheet;
  final String? outstandingShares;
  final String? logoPath;
  final String? companySummary;
  final String? listing;

  Company(
    this.id,
    this.name,
    this.symbol,
    this.isinNo,
    this.yearEnd,
    this.founded,
    this.dateListed,
    this.balanceSheet,
    this.outstandingShares,
    this.logoPath,
    this.companySummary,
    this.listing,
  );

  static List<Company> jsonDecode(List<dynamic> jsonList) {
    return (jsonList).map((i) => Company.fromJson(i)).toList();
  }

  factory Company.fromJson(Map<String, dynamic> json) => Company(
    json["id"],
    json["name"],
    json["symbol"],
    json["isin_no"],
    json["year_end"],
    json["founded"],
    json["date_listed"],
    json["balance_sheet"].toString(),
    json["outstanding_shares"].toString(),
    json["logo_path"],
    json["company_summary"],
    json["listing"],
  );
}
