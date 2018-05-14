import 'dart:async';
import 'dart:collection';

import 'package:starter/book_resp/book_resp.dart';
import 'package:starter/contracts/book_store_contract.dart';

import 'package:http/http.dart' as http;
import 'package:starter/config/douban_config.dart';
import 'package:starter/contracts/rest_api_contract.dart';
import 'package:starter/helper/json_parser.dart';
import 'package:starter/helper/rest_api_http_impl.dart';

class DoubanService extends BookStoreContract with JSONParser<BookResp,
    http.Response> {

  final config;
  final RestApiContract<Future<http.Response>> webService;

  DoubanService.withWebService(webService) :
    this.webService = webService ?? new RestApiHttpImpl(), this.config = new
      DoubanConfig();

  DoubanService(this.config, this.webService);

  @override
  Future<BookResp> getBooks(int start, int count, String tag) async {
    String query = _buildQuery(new Map<String, String>.fromIterables(["start",
    "count", "tag"], [start.toString(), count.toString(), tag]));

    Map<String, String> httpHeaders = new HashMap<String, String>();
    httpHeaders.putIfAbsent("Content-Type", () => "application/json; "
        "charset=utf-8");
    final resp = await webService.get("${config.url}/v2/book/search$query",
        headers: httpHeaders);
    return decode(resp, (resp) => resp.body, (jsonMap) => BookResp.fromJson
      (jsonMap));
  }

  String _buildQuery(Map<String, String> parameters) {
    if (parameters == null || parameters.isEmpty) {
      return "";
    }
    return "?${parameters.entries.map((entry) => "${entry.key}=${entry
        .value}&").join()}";
  }

}
