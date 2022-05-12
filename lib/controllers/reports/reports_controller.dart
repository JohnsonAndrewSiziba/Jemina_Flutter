import 'package:jemina_capital/controllers/controller.dart';
import 'package:jemina_capital/data/constants/api_routes.dart';
import 'package:jemina_capital/library/request_response.dart';

class ReportsController extends Controller {
  // get all reports from server
  Future<RequestResponse> getDailyTradingUpdates() {
    Future<RequestResponse> response =
        makeGetRequest(url: Routes.getDailyTradingUpdatesRoute);
    return response;
  }

  Future<RequestResponse> getWeeklyTradingUpdates() {
    Future<RequestResponse> response =
        makeGetRequest(url: Routes.getWeeklyTradingUpdatesRoute);
    return response;
  }

  Future<RequestResponse> getMonthlyTradingUpdates() {
    Future<RequestResponse> response =
        makeGetRequest(url: Routes.getMonthlyTradingUpdatesRoute);
    return response;
  }

  Future<RequestResponse> getSpecialReports() {
    Future<RequestResponse> response =
        makeGetRequest(url: Routes.getSpecialReportsRoute);
    return response;
  }

}
