import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutterbeer/edit_views/create_tasting.dart';
import 'package:flutterbeer/edit_views/edit_beer.dart';
import 'package:flutterbeer/edit_views/join_tasting.dart';
import 'package:flutterbeer/edit_views/beer_vote.dart';
import 'package:flutterbeer/state/reducer.dart';
import 'package:flutterbeer/state/app_state.dart';
import 'package:flutterbeer/vote.dart';
import 'package:redux/redux.dart';
import 'package:flare_flutter/flare_actor.dart';

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
        initialRoute: SplashScreen.routeName,
        routes: {
          MainScreen.routName: (context) => MainScreen(),
          SplashScreen.routeName: (context) => SplashScreen(),
          CreateTasting.routeName: (context) => CreateTasting(),
          EditBeer.routeName: (context) => EditBeer(),
          Vote.routeName: (context) => Vote(),
          BeerVote.routeName: (context) => BeerVote(),

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
  static const routName = '/';
  const MainScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.local_bar),
        title: Text('Beer tastings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: JoinTasting(),
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

class SplashScreen extends StatefulWidget {
  static const routeName = '/splash';
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
      child: FlareActor('animations/tasting.flr',
          alignment: Alignment.center,
          fit: BoxFit.contain,
          animation: 'beer',
          callback: (s) => Navigator.pop(context),
          ),
    );
  }
}