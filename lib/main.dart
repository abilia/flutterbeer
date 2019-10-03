import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flare_flutter/flare_actor.dart';

import 'package:flutterbeer/edit_views/create_tasting.dart';
import 'package:flutterbeer/edit_views/edit_beer.dart';
import 'package:flutterbeer/edit_views/join_tasting.dart';

import 'package:flutterbeer/state/actions.dart';
import 'package:flutterbeer/state/reducer.dart';
import 'package:flutterbeer/state/app_state.dart';

import 'pages/beer_vote_page.dart';
import 'pages/vote_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  final Store<AppState> store = Store<AppState>(
    appReducer,
    initialState: AppState.initial(),
    middleware: [thunkMiddleware]
  );

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        initialRoute: SplashScreen.routeName,
        routes: {
          MainScreen.routeName: (context) => MainScreen(),
          SplashScreen.routeName: (context) => SplashScreen(),
          EditBeer.routeName: (context) => EditBeer(),
          VotePage.routeName: (context) => VotePage(),
          BeerVotePage.routeName: (context) => BeerVotePage(),
        },
        onGenerateRoute: (settings) {
          if (settings.name == CreateTasting.routeName) {
            return MaterialPageRoute(
                builder: (context) => CreateTasting(
                      tasting: settings.arguments,
                    ));
          }
        },
        title: 'Flutter beer',
        theme: ThemeData(
            sliderTheme: SliderThemeData.fromPrimaryColors(
                    primaryColor: Colors.orange,
                    primaryColorDark: Colors.orange,
                    primaryColorLight: Colors.orange,
                    valueIndicatorTextStyle: TextStyle())
                .copyWith(
                    trackHeight: 10,
                    thumbShape: RoundSliderThumbShape(
                        disabledThumbRadius: 20, enabledThumbRadius: 20)),
            primarySwatch: Colors.brown,
            accentColor: Colors.orangeAccent,
            buttonColor: Colors.orange,
            scaffoldBackgroundColor: Colors.grey[200]),
      ),
    );
  }
}

class MainScreen extends StatelessWidget {
  static const routeName = '/';
  const MainScreen({
    Key key,
  }) : super(key: key);

  Future<void> _getTastings(context) async {
    StoreProvider.of<AppState>(context).dispatch(getTastingsThunk);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.local_bar),
        title: Text('Beer tastings'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: RefreshIndicator(
          child: JoinTasting(),
          onRefresh: () {
            return _getTastings(context);
          },
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

class SplashScreen extends StatefulWidget {
  static const routeName = '/splash';
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  Widget build(BuildContext context) {
    StoreProvider.of<AppState>(context).dispatch(getTastingsThunk);
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: FlareActor(
        'animations/tasting.flr',
        alignment: Alignment.center,
        fit: BoxFit.contain,
        animation: 'beer',
        callback: (s) => Navigator.pop(context),
      ),
    );
  }
}
