import 'dart:convert';
import 'package:http/http.dart';
import 'api_constants.dart';

class ApiClient {
  final Client _client;

  ApiClient(this._client);

  dynamic get(String path, {Map<dynamic, dynamic> params}) async {
    final response = await _client.get(getPath(path, params),
        headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

String getPath(String path, Map<dynamic, dynamic> params) {
  var paramString = '';
  if (params?.isNotEmpty ?? false) {
    params.forEach((key, value) {
      paramString += '&$key=$value';
    });
  }

  return '${ApiConstants.base_url}$path?api_key=${ApiConstants.api_key}$paramString';
}
