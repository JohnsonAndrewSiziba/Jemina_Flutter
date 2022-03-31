import 'package:jemina_capital/controllers/controller.dart';
import 'package:jemina_capital/data/constants/api_routes.dart';
import 'package:jemina_capital/library/request_response.dart';

class ReportsController extends Controller {
  // get all reports from server
  Future<RequestResponse> getAllReports() {
    Future<RequestResponse> response =
        makeGetRequest(url: Routes.getAllReportsRoute);
    return response;
  }
}
