import 'package:flutter/material.dart';
import 'package:starter/book_detail_page.dart';
import 'package:starter/book_repository.dart';
import 'package:starter/books_home_page.dart';

void main() => runApp(new MyApp());

class AnimatedRoute<T> extends MaterialPageRoute<T> {
  AnimatedRoute({WidgetBuilder builder, RouteSettings settings})
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return child;
    // Fades between routes. (If you don't want any animation,
    // just return child.)
//    return new FadeTransition(opacity: animation, child: child);
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Welcome to Flutter',
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/':
            return AnimatedRoute(
                builder: (_) =>
                    new BooksHomePage(repository: new BookRepository()),
                settings: settings);
        }
      },
    );
  }
}
