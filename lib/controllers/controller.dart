import 'package:jemina_capital/data/shared_preference/shared_preference_manager.dart';

import '../data/constants/api_routes.dart';
// import 'package:http/http.dart' as http;

import 'dart:convert';
import 'package:http/http.dart';
import 'dart:io';

import '../library/request_response.dart';



class Controller{

  Future<Map<String, String>> getHeaders() async {
    SharedPreferenceManager sharedPreferenceManager = SharedPreferenceManager();
    var token = await sharedPreferenceManager.getAccessToken();
    var headers = {
      "content-type": 'application/json',
      "authorization": 'Bearer $token',
    };
    return headers;
  }


  void postRequest(){

  }

  void getRequest(){

  }

  void guestPostRequest(){

  }

  void guestGetRequest(){

  }


  Future<RequestResponse> makeGetRequest({required Uri url}) async {
    Response response = await get(url, headers: await getHeaders());
    print('Status code: ${response.statusCode}');
    print('Headers: ${response.headers}');
    print('Body: ${response.body}');

    return RequestResponse(response.body);
  }

  Future<RequestResponse> makePostRequest({required Uri url, required Map<String, dynamic> body}) async {
    String jsonBody = json.encode(body);
    final encoding = Encoding.getByName('utf-8');

    final response = await post(
        url,
        headers: await getHeaders(),
        body: jsonBody,
        encoding: encoding
    );

    print('Status code: ${response.statusCode}');
    print('Body: ${response.body}');
    return RequestResponse(response.body);
  }

  // Future<RequestResponse> makePostRequest({required String url, required String body}) async {
  //   final url = Uri.parse('$urlPrefix/posts');
  //   final headers = {"Content-type": "application/json"};
  //   final json = '{"title": "Hello", "body": "body text", "userId": 1}';
  //   final response = await post(url, headers: headers, body: json);
  //   print('Status code: ${response.statusCode}');
  //   print('Body: ${response.body}');
  // }

  // Future<void> makePutRequest() async {
  //   final url = Uri.parse('$urlPrefix/posts/1');
  //   final headers = {"Content-type": "application/json"};
  //   final json = '{"title": "Hello", "body": "body text", "userId": 1}';
  //   final response = await put(url, headers: headers, body: json);
  //   print('Status code: ${response.statusCode}');
  //   print('Body: ${response.body}');
  // }

  // Future<void> makePatchRequest() async {
  //   final url = Uri.parse('$urlPrefix/posts/1');
  //   final headers = {"Content-type": "application/json"};
  //   final json = '{"title": "Hello"}';
  //   final response = await patch(url, headers: headers, body: json);
  //   print('Status code: ${response.statusCode}');
  //   print('Body: ${response.body}');
  // }

  // Future<void> makeDeleteRequest() async {
  //   final url = Uri.parse('$urlPrefix/posts/1');
  //   final response = await delete(url);
  //   print('Status code: ${response.statusCode}');
  //   print('Body: ${response.body}');
  // }

}