import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutterbeer/edit_views/create_tasting.dart';
import 'package:flutterbeer/edit_views/join_tasting.dart';

import 'package:flutterbeer/state/actions.dart';
import 'package:flutterbeer/state/app_state.dart';

class TastingsList extends StatelessWidget {
  static const routeName = '/tastings';
  const TastingsList({
    Key key,
  }) : super(key: key);

  Future<void> _getTastings(store) async {
    store.dispatch(getTastingsThunk);
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Store<AppState>>(
      converter: (Store<AppState> store) => store,
      builder: (context, store) {
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
                return _getTastings(store);
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
    });
  }
}