import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:starter/presentation/home_screen.dart';
import 'package:starter/states/app_state.dart';
import 'package:starter/reducers/app_state_reducer.dart';


void main() => runApp(new ReduxApp());

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

class ReduxApp extends StatelessWidget {
  final store = Store<AppState>(
    appReducer,
    initialState: AppState.initial()
  );

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: new MaterialApp(
        title: 'Welcome to Flutter',
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case '/':
              return AnimatedRoute(
                  builder: (_) =>
                  new HomeScreen(),
                  settings: settings);
          }
        },
      )
    );
  }
}

