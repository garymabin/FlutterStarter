import 'package:starter/states/app_state.dart';
import 'package:starter/reducers/book_list_reducer.dart';

AppState appReducer(AppState state, action) {
  return AppState(
      bookListReducers(state.bookListState, action)
  );
}
