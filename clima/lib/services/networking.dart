import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkHelper {
  final String url;

  NetworkHelper(this.url);

  Future getData() async {
    http.Response response = await http.get(url);
    var data;
    if (response.statusCode == 200) {
      data = jsonDecode(response.body);
    } else {
      print('HttpErrorCode: ${response.statusCode}');
      print(response.body);
    }

    return data;
  }
}
