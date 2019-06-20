import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutterbeer/model/app_model.dart';
import 'package:flutterbeer/state/app_state.dart';
import 'package:redux/redux.dart';

class BeerVote extends StatefulWidget {
    static const routeName = '/beervote';
    @override
    _BeerVoteState createState() => _BeerVoteState();
}

class _BeerVoteState extends State<BeerVote> {
  @override
  Widget build(BuildContext context) {
    Beer beer = ModalRoute.of(context).settings.arguments;

    return StoreConnector<AppState, Store<AppState>>( 
      converter: (Store<AppState> store) => store,
      builder: (context, store) {
        return Scaffold(
          appBar: AppBar( 
            title: Text(beer.name),
          ),
          body: Center(
            child: Text("Den var god!"),
          ),
        );
      },
    );
  }
}