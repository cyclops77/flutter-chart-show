import 'package:charts/endpoint.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Controller {
  static Future getIndex() async {
    final response = await http.get(EndPoint.main);
    var bodynya = json.decode(response.body);
    print(bodynya.toString());
    return bodynya['list_perkembangan'];
  }
}
