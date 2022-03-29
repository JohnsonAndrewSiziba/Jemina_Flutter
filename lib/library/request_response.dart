import 'dart:convert';

class RequestResponse{
  final String body;

  RequestResponse(this.body);

  Map<String, dynamic> getJsonBody(){
    return jsonDecode(body);
  }

  String getError(){
    var errors = getJsonBody()['errors'];
    var theJson = jsonDecode(errors);
    return theJson.keys.toList()[0];
  }
}