import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class BaseApiCall {
  final storage = const FlutterSecureStorage();
  final headers = {'Content-Type': 'application/json'};

  Future<Request> getRequest(String method, String baseUrl, String actionUrl,
      Map<String, dynamic> params, Map<String, String> append) async {
    print("$method : $baseUrl $actionUrl");
    print("$params");
    var request = http.Request(method, Uri.https(baseUrl, actionUrl, params));

    request.headers.addAll(headers);
    request.headers.addAll(append);

    return request;
  }

  String toJsonString(Map<String, dynamic> data) {
    return json.encoder.convert(data);
  }
}
