import 'package:jemina_capital/controllers/controller.dart';
import 'package:jemina_capital/library/request_response.dart';

class AuthController extends Controller{
  RequestResponse register({required String name, required String email, required String password}){
    return RequestResponse(true, "Message");
  }
}