import 'package:jemina_capital/controllers/controller.dart';
import 'package:jemina_capital/data/constants/api_routes.dart';
import 'package:jemina_capital/library/request_response.dart';

class PriceSheetsController extends Controller {

  Future<RequestResponse> getTopMarqueePrices() {
    Future<RequestResponse> response =
    makeGetRequest(url: Routes.getTopMarqueePrices);
    return response;
  }
}
