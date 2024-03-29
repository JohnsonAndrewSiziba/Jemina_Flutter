import 'package:jemina_capital/controllers/controller.dart';
import 'package:jemina_capital/library/request_response.dart';
import 'dart:convert';


import '../../data/constants/api_routes.dart';

class AuthController extends Controller{

  Future<RequestResponse> register({required String name, required String email, required String password}) {
    Map<String, dynamic> body = {
      'name': name,
      'email': email,
      'password': password,
      'device': "Mobile",
    };
    Future<RequestResponse> response =  makePostRequest(url: Routes.registerRoute, body: body);

    return response;
  }

  Future<RequestResponse> login({required String email, required String password}) {
    Map<String, dynamic> body = {
      'email': email,
      'password': password,
      'device': "Mobile",
    };
    Future<RequestResponse> response =  makePostRequest(url: Routes.loginRoute, body: body);
    return response;
  }

  Future<RequestResponse> verifyEmail({required String verificationCode}) {
    Map<String, dynamic> body = {
      'verification_code': verificationCode,
    };

    Future<RequestResponse> response =  makePostRequest(url: Routes.confirmEmailRoute, body: body);

    return response;
  }

}