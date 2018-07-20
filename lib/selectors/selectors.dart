import 'package:starter/states/app_state.dart';
import 'package:starter/states/book_list_state.dart';

BookListState bookListStateSelector(AppState state) => state.bookListState;
