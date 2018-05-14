import 'package:starter/douban_service.dart';

class BookRepository {
  final DoubanService doubanService;

  BookRepository(doubanService) : this.doubanService = doubanService ??
      new DoubanService.withWebService(null);
}
