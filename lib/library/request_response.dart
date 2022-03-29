import 'dart:convert';

class RequestResponse{
  final String body;

  RequestResponse(this.body);

  Map<String, dynamic> getJsonBody(){
    return jsonDecode(body);
  }
}