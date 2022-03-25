class Routes{
  // API HOME
  static const String apiHome = "http://127.0.0.1:8000/api";

  // AUTH ROUTES
  static const loginRoute = "$apiHome/mobile/login";
  static const logoutRoute = "$apiHome/mobile/logout";
  static const registerRoute = "$apiHome/mobile/register";
  static const confirmEmailRoute = "$apiHome/mobile/confirm-email";
  static const sendEmailNotificationRoute = "$apiHome/mobile/send-email-confirmation";

}