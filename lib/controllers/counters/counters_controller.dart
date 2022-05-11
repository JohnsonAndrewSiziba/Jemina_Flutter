import '../../data/constants/api_routes.dart';
import '../../library/request_response.dart';
import '../controller.dart';

class CountersController extends Controller{
  Future<RequestResponse> getZseEquityCounters() {
    Future<RequestResponse> response = makeGetRequest(url: Routes.getZseEquityCountersRoute);
    return response;
  }

  Future<RequestResponse> getZseEtfCounters() {
    Future<RequestResponse> response = makeGetRequest(url: Routes.getZseEtfCountersRoute);
    return response;
  }

  Future<RequestResponse> getVfexEquityCounters() {
    Future<RequestResponse> response = makeGetRequest(url: Routes.getVfexEquityCountersRoute);
    return response;
  }


}