import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutterbeer/state/app_state.dart';
import 'package:flutterbeer/widgets/join_card.dart';

class JoinTasting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
      converter: (Store<AppState> store) => store.state,
      builder: (context, state) => ListView(
              children: state.tastings.map((t) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: JoinCard(beerTasting: t),
            );
          }).toList()),
    );
  }
}
