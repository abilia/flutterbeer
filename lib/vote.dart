import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutterbeer/state/app_state.dart';
import 'package:redux/redux.dart';

import 'model/app_model.dart';

class Vote extends StatelessWidget {
  List<Widget> getAll(AppState appstate) {
    List<Widget> list = new List<Widget>();
    for (BeerTasting t in appstate.tastings) {
      list.add(Text(t.title));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Make your votes"),),
      body: Column(
        children: <Widget>[
          StoreConnector<AppState, AppState>(
            converter: (Store<AppState> store) => store.state,
            builder: (context, state) {
              return Column(children: getAll(state));
            },
          ),
        ],
      ),
    );
  }
}
