import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutterbeer/state/app_state.dart';
import 'package:redux/redux.dart';

import '../vote.dart';

class JoinTasting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
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
    );
  }
}
