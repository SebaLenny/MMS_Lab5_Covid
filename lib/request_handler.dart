import 'package:http/http.dart' as http;

class RequestHandler {
  static Future<String> fetchFreshData() async {
    final response = await http.get('https://api.covid19api.com/summary');
    if (response.statusCode == 200) {
      if (response.body.contains("You have reached maximum request limit")) {
        return "";
      }
      return response.body;
    }
    return "";
  }
}
