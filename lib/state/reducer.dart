import 'package:flutterbeer/corona/model.dart';
import 'package:flutterbeer/model/app_model.dart';
import 'package:meta/meta.dart';

import 'app_state.dart';

enum BeerActions { TastingsLoaded, AddTasting, EditTasting, VotePlaced, BeersLoaded, BeerAdded, BeerUpdated }

class ActionPayload {
  BeerActions action;
  dynamic data;
  ActionPayload({@required this.action, this.data});
}

AppState appReducer(AppState state, dynamic action) {
  return AppState(
      tastings: tastingsReducer(state, action),
      votes: votesReducer(state, action),
      coronabeers: coronaReducer(state, action)
  );
}

List<BeerTasting> tastingsReducer(AppState state, action) {
  switch (action.action) {
    case BeerActions.TastingsLoaded:
      return action.data as List<BeerTasting>;
    case BeerActions.AddTasting:
      return [action.data as BeerTasting, ...state.tastings].toList();
    case BeerActions.EditTasting:
      final BeerTasting toBeEdited = action.data;
      final newTastings = state.tastings.toList();
      return newTastings
        ..removeWhere((tasting) => tasting.id == toBeEdited.id)
        ..add(toBeEdited);
    default:
  }
  return state.tastings;
}

List<BeerVote> votesReducer(AppState state, action) {
  switch (action.action) {
    case BeerActions.VotePlaced:
      final vote = action.data as BeerVote;
      return [...state.votes.where((v) => v.beerId != vote.beerId), vote];
  }
  return state.votes;
}

List<CoronaBeer> coronaReducer(AppState state, action) {
  switch (action.action) {
    case BeerActions.BeersLoaded:
      return action.data as List<CoronaBeer>;
    case BeerActions.BeerAdded:
      return [action.data as CoronaBeer, ...state.coronabeers].toList();
    case BeerActions.BeerUpdated:
      final CoronaBeer toBeEdited = action.data;
      final coronabeers = state.coronabeers.toList();
      return coronabeers
        ..removeWhere((beer) => beer.beerId == toBeEdited.beerId)
        ..add(toBeEdited);
    default:
  }
  return state.coronabeers;
}
