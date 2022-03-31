import 'package:jemina_capital/controllers/controller.dart';
import '../../data/constants/api_routes.dart';
import 'package:jemina_capital/library/request_response.dart';

class NewsController extends Controller {
  Future<RequestResponse> getNews() {
    Future<RequestResponse> response = makeGetRequest(url: Routes.getNewsRoute);
    return response;
  }
}
