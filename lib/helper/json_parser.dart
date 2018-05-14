import 'dart:convert';

class JSONParser<T, V> {
  T decode(V content, String contentSupplier(V content), T converter
      (Map<String,
      dynamic>
  jsonMap)) {
    return converter(json.decode(contentSupplier(content)));
  }
}
