import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutterbeer/state/reducer.dart';
import 'package:redux/redux.dart';
import 'package:flutterbeer/add_beer_view.dart';
import 'package:flutterbeer/create_testing.dart';
import 'package:flutterbeer/vote.dart';

import 'state/app_state.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  final Store<AppState> store = Store<AppState>(
    appReducer,
    initialState: AppState.initial(),
  );

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => MainScreen(),
          '/create': (context) => CreateTesting(),
          '/create/add': (context) => AddBeer(),
          '/vote': (context) => Vote()
        },
        title: 'Flutter beer',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
      ),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.local_bar),
        title: Text('flutter bear'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            StoreConnector<AppState, AppState>(
              converter: (Store<AppState> store) => store.state,
              builder: (context, state) {
                return Column(
                    children: state.tastings
                        .map((t) => RaisedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/vote',
                                  arguments: t.id);
                            },
                            child: Text(t.title)))
                        .toList());
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/create');
        },
        child: Icon(Icons.add_box),
      ),
    );
  }
}
