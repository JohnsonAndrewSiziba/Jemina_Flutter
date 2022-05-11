import '../../data/constants/api_routes.dart';
import '../../library/request_response.dart';
import '../controller.dart';

class CountersListController extends Controller{
  Future<RequestResponse> getZSECounters() {
    Future<RequestResponse> response = makeGetRequest(url: Routes.getZSETradingCountersRoute);
    return response;
  }

  Future<RequestResponse> getZseEtfCounters() {
    Future<RequestResponse> response = makeGetRequest(url: Routes.getZseEtfTradingCountersRoute);
    return response;
  }

}