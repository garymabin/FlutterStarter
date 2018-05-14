import 'dart:async';

import 'package:starter/contracts/rest_api_contract.dart';
import 'package:http/http.dart' as http;


class RestApiHttpImpl extends RestApiContract<Future<http.Response>> {
  @override
  delete(String url, body) {
    // TODO: implement delete
  }

  @override
  get(String url, {Map<String, String> headers}) {
    return http.get(url, headers: headers);
  }

  @override
  post(String url, body, {Map<String, String> headers}) {
    // TODO: implement post
  }

  @override
  put(String url, body) {
    // TODO: implement put
  }

}
