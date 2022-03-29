class Routes{
  // API HOME
  static const String apiHome = "http://127.0.0.1:8000/api";

  // AUTH ROUTES
  static Uri loginRoute =  Uri.parse("$apiHome/mobile/login");
  static Uri logoutRoute = Uri.parse("$apiHome/mobile/logout");
  static Uri registerRoute = Uri.parse("$apiHome/mobile/register");
  static Uri confirmEmailRoute = Uri.parse("$apiHome/mobile/confirm-email");
  static Uri sendEmailNotificationRoute = Uri.parse("$apiHome/mobile/send-email-confirmation");



  // testing
  static Uri getPriceSheetDate = Uri.parse("$apiHome/get_price_sheet_date");

}