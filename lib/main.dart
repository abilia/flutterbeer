import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutterbeer/edit_views/create_tasting.dart';
import 'package:flutterbeer/edit_views/edit_beer.dart';
import 'package:flutterbeer/model/app_model.dart';
import 'package:flutterbeer/state/reducer.dart';
import 'package:flutterbeer/state/app_state.dart';
import 'package:flutterbeer/vote.dart';
import 'package:redux/redux.dart';


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
          CreateTasting.routeName: (context) => CreateTasting(BeerTasting()),
          EditBeer.routeName: (context) => EditBeer(),
          Vote.routeName: (context) => Vote()
        },
        title: 'Flutter beer',
        theme: ThemeData(
            primarySwatch: Colors.brown,
            accentColor: Colors.orangeAccent,
            buttonColor: Colors.orange,
            scaffoldBackgroundColor: Colors.grey[200]),
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
        child: StoreConnector<AppState, AppState>(
          converter: (Store<AppState> store) => store.state,
          builder: (context, state) => Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: state.tastings.map((t) {
                return RaisedButton(
                    child: Text(t.title),
                    onPressed: () {
                      Navigator.pushNamed(context, Vote.routeName,
                          arguments: t.id);
                    });
              }).toList()),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: StadiumBorder(),
        onPressed: () {
          Navigator.pushNamed(context, CreateTasting.routeName);
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}
