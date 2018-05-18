import 'dart:collection';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:starter/api/douban_service.dart';
import 'package:starter/config/douban_config.dart';
import 'package:starter/contracts/rest_api_contract.dart';
import 'package:test/test.dart';

// Mock class
class MockRestApiContract extends Mock
    implements RestApiContract<Future<http.Response>> {}

class MockDoubanConfig extends Mock implements DoubanConfig {}

void main() {
  test('should pass correct parameter to http library', () async {
    var testResponse = new http.Response(
        "{\"count\": 1, \"start\": 0, \"total\": 200,"
        "\"books\": []}",
        200);
    var mockRestApiContract = new MockRestApiContract();

    var expectedStart = 0;
    var expectedCount = 20;
    var expectedTag = 'TAG';
    var expectedUrl = "expectedUrl";

    var doubanConfig = new MockDoubanConfig();

    Map<String, String> httpHeaders = new HashMap<String, String>();
    httpHeaders.putIfAbsent(
        "Content-Type",
        () => "application/json; "
            "charset=utf-8");

    var doubanService = new DoubanService.withConfigAndWebService(
        doubanConfig, mockRestApiContract);

    when(doubanConfig.url).thenReturn(expectedUrl);

    when(mockRestApiContract.get(typed(any)))
        .thenAnswer((_) => new Future.value(testResponse));

    doubanService.getBooks(expectedStart, expectedCount, expectedTag);

    await untilCalled(mockRestApiContract.get(typed(any)));

    verify(mockRestApiContract
        .get("expectedUrl/v2/book/search?start=0&count=20&tag=TAG&"));
  });
}
