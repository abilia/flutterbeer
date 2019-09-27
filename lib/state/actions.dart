import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

import 'package:flutterbeer/state/app_state.dart';
import 'package:flutterbeer/state/reducer.dart';
import 'package:flutterbeer/api/api.dart';

ThunkAction<AppState> getTastingsThunk = (Store<AppState> store) async {
  /*
  final tastings = await new Future.delayed(new Duration(seconds: 1), () => [
    BeerTasting(title: "IPA", beers: [Beer(name: "IPA 1"), Beer(name: "IPA 2")])
  ]); */
  final tastings = await getBeerTastings();
  store.dispatch(ActionPayload(action: BeerActions.TastingsLoaded, data: tastings));
};
