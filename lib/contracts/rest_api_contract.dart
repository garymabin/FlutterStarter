abstract class RestApiContract<Resp> {
  Resp get(String url, {Map<String, String> headers});

  Resp post(String url, dynamic body, {Map<String, String> headers});

  Resp put(String url, dynamic body);

  Resp delete(String url, dynamic body);
}
