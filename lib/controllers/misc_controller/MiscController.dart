import 'package:jemina_capital/controllers/controller.dart';
import 'package:jemina_capital/data/constants/api_routes.dart';
import 'package:jemina_capital/library/request_response.dart';

class MiscellaneousController extends Controller {

  Future<RequestResponse> getQuote() {
    Future<RequestResponse> response =
    makeGetRequest(url: Routes.getQuote);
    return response;
  }
}
