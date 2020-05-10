import 'dart:convert';
import 'package:http/http.dart' as http;

Future<dynamic> getData({String controlNumber}) async{
  var url = 'http://zamboangacity.gov.ph:86/api/v1/qpass?control_number=$controlNumber';

  Map<String, String> headers = {"Content-type": "application/json"};
  http.Response response = await http.get(url, headers: headers,);

  var data = jsonDecode(response.body);
  if (data["statusCode"] == 404) {
    data = null;
  }

  return data;
}
