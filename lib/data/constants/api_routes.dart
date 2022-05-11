class Routes {
  // API HOME
  // static const String apiHome = "http://127.0.0.1:8000/api";
  // static const String serverHome = "http://127.0.0.1:8000";

  static const String apiHome = "https://jemina.capital/api";
  static const String serverHome = "https://jemina.capital";

  // AUTH ROUTES
  static Uri loginRoute = Uri.parse("$apiHome/mobile/login");
  static Uri logoutRoute = Uri.parse("$apiHome/mobile/logout");
  static Uri registerRoute = Uri.parse("$apiHome/mobile/register");
  static Uri confirmEmailRoute = Uri.parse("$apiHome/mobile/a/confirm-email");
  static Uri sendEmailNotificationRoute =
      Uri.parse("$apiHome/mobile/send-email-confirmation");

  // testing
  static Uri getPriceSheetDate = Uri.parse("$apiHome/get_price_sheet_date");

  //NEWS ROUTES
  static Uri getNewsRoute = Uri.parse("$apiHome/mobile/v/news");

  //REPORTS ROUTES
  static Uri getDailyTradingUpdatesRoute = Uri.parse("$apiHome/research/daily-trading-updates");
  static Uri getWeeklyTradingUpdatesRoute = Uri.parse("$apiHome/research/weekly-trading-updates");
  static Uri getMonthlyTradingUpdatesRoute = Uri.parse("$apiHome/research/monthly-trading-updates");
  static Uri getSpecialReportsRoute = Uri.parse("$apiHome/research/special-reports");

  //COUNTERS ROUTES
  static Uri getZseEquityCountersRoute = Uri.parse("$apiHome/research/zse-equity-counters");
  static Uri getZseEtfCountersRoute = Uri.parse("$apiHome/research/zse-etf-counters");
  static Uri getVfexEquityCountersRoute = Uri.parse("$apiHome/research/vfex-equity-counters");

  //MARKET STATISTICS ROUTES
  static Uri getTopMarqueePrices = Uri.parse("$apiHome/mobile/v/marquee-prices");
  static Uri getPriceSheet = Uri.parse("$apiHome/mobile/v/price_sheet");


  //MISC ROUTES
  static Uri getQuote = Uri.parse("$apiHome/quote");


  //TRADING ROUTES
  static Uri getZSETradingCountersRoute = Uri.parse("$apiHome/trading/zse-trading-counters");
  static Uri getZseEtfTradingCountersRoute = Uri.parse("$apiHome/trading/zse-etf-trading-counters");

}
