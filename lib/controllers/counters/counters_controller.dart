import '../../data/constants/api_routes.dart';
import '../../library/request_response.dart';
import '../controller.dart';

class CountersController extends Controller{
  Future<RequestResponse> getZSECounters() {
    Future<RequestResponse> response = makeGetRequest(url: Routes.getZSECountersRoute);
    return response;
  }
}