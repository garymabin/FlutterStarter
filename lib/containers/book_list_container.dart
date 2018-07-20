
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:starter/main.dart';
import 'package:starter/presentation/book_detail_screen.dart';
import 'package:starter/selectors/selectors.dart';
import 'package:starter/states/app_state.dart';
import 'package:starter/states/book_list_state.dart';
import 'package:starter/widgets/book_list_widget.dart';

class BookListContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, _ViewModel>(
        converter: (Store<AppState> store) {
      return _ViewModel.fromStore(store);
    }, builder: (BuildContext context, _ViewModel viewModel) {
      return new BookListWidget(viewModel.bookListState.books,
          onTap: (index) => viewModel.onBookItemTap(context, index));
    });
  }
}

class _ViewModel {
  final BookListState bookListState;

  final Function(BuildContext context, int) onBookItemTap;

  _ViewModel(
      {@required this.bookListState,
      @required this.onBookItemTap});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
        bookListState: bookListStateSelector(store.state),
        onBookItemTap: (context, index) {
          Navigator.push(context,
              new AnimatedRoute(builder: (_) => new BookDetailScreen(index)));
        });
  }
}
