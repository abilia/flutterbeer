import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutterbeer/model/app_model.dart';
import 'package:flutterbeer/state/app_state.dart';
import 'package:redux/redux.dart';


class Vote extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String tastingId = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("Make your votes"),
      ),
      body: Column(
        children: <Widget>[
          StoreConnector<AppState, BeerTasting>(
              converter: (Store<AppState> store) => store.state.tastings
                  .singleWhere((tasting) => tasting.id == tastingId),
              builder: (context, tasting) {
                final c = List<Widget>.of([Text(tasting.title)]);
                c.addAll((tasting.beers.map((t) => Text(t.name)).toList()));
                return Column(children: c);
              }),
        ],
      ),
    );
  }
}
