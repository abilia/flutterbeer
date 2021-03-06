import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

import 'package:flutterbeer/state/app_state.dart';
import 'package:flutterbeer/state/reducer.dart';
import 'package:flutterbeer/api/api.dart';
import 'package:flutterbeer/model/app_model.dart';
import 'package:flutterbeer/corona/model.dart';

ThunkAction<AppState> getTastingsThunk = (Store<AppState> store) async {
  /*
  final tastings = await new Future.delayed(new Duration(seconds: 1), () => [
    BeerTasting(title: "IPA", beers: [Beer(name: "IPA 1"), Beer(name: "IPA 2")])
  ]); */
  final tastings = await getBeerTastings();
  for (BeerTasting tasting in tastings) {
    final beers = await getBeers(tasting.tastingId);
    tasting.beers = beers;
  }
  
  store.dispatch(ActionPayload(action: BeerActions.TastingsLoaded, data: tastings));
};

ThunkAction<AppState> upsertTastingThunk(bool update, BeerTasting tasting) => (Store<AppState> store) async {
  BeerTasting beerTasting = tasting;
  if (update) {

  } else {
    beerTasting = await addBeerTasting(tasting);
  }

  store.dispatch(ActionPayload(action: update ? BeerActions.EditTasting : BeerActions.AddTasting, data: beerTasting));
};

ThunkAction<AppState> getCoronaBeersThunk = (Store<AppState> store) async {
  final beers = await getCoronaBeers();
  store.dispatch(ActionPayload(action: BeerActions.BeersLoaded, data: beers));
};

ThunkAction<AppState> upsertCoronaBeerThunk(bool update, CoronaBeer coronaBeer) => (Store<AppState> store) async {
  CoronaBeer beer = coronaBeer;
  if (update) {
    beer = await updateCoronaBeer(coronaBeer);
  } else {
    beer = await addCoronaBeer(coronaBeer);
  }
  
  store.dispatch(ActionPayload(action: update ? BeerActions.BeerUpdated : BeerActions.BeerAdded, data: beer));
};