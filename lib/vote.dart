import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutterbeer/state/app_state.dart';
import 'package:redux/redux.dart';

class Vote extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Make your votes"),
      ),
      body: Column(
        children: <Widget>[
          StoreConnector<AppState, AppState>(
            converter: (Store<AppState> store) => store.state,
            builder: (context, state) {
              return Column(
                children: state.tastings.map((t) => Text(t.title)).toList());
            },
          ),
        ],
      ),
    );
  }
}
