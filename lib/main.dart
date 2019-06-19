import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutterbeer/edit_views/edit_beer.dart';
import 'package:flutterbeer/model/app_model.dart';
import 'package:redux/redux.dart';

import 'state/reducer.dart';
import 'join_testing.dart';
import 'vote.dart';
import 'edit_views/create_testing.dart';
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
          CreateTesting.routeName: (context) => CreateTesting(BeerTasting()),
          EditBeer.routeName: (context) => EditBeer(),
          '/join': (context) => JoinTesting(),
          '/vote': (context) => Vote()
        },
        title: 'Flutter beer',
        theme: ThemeData(
          primarySwatch: Colors.brown,
          accentColor: Colors.orangeAccent,
          buttonColor: Colors.orange,
          scaffoldBackgroundColor: Colors.grey[200]
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
            RaisedButton(
                child: Text('Create'),
                onPressed: () {
                  Navigator.pushNamed(context, CreateTesting.routeName);
                }),
            RaisedButton(
              child: Text('Vote'),
              onPressed: () {
                Navigator.pushNamed(context, '/vote');
              },
            )
          ],
        ),
      ),
    );
  }
}
