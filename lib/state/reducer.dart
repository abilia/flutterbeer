import 'package:flutterbeer/model/app_model.dart';
import 'package:meta/meta.dart';

import 'app_state.dart';

enum Actions { AddTasting, EditTasting, VotePlaced }

class ActionPayload {
  Actions action;
  dynamic data;
  ActionPayload({@required this.action, this.data});
}

AppState appReducer(AppState state, dynamic action) {
  return AppState(
      tastings: tastingsReducer(state, action),
      votes: votesReducer(state, action));
}

List<BeerTasting> tastingsReducer(AppState state, action) {
  switch (action.action) {
    case Actions.AddTasting:
      return [action.data as BeerTasting, ...state.tastings].toList();
    case Actions.EditTasting:
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
    case Actions.VotePlaced:
      final vote = action.data as BeerVote;
      return [...state.votes.where((v) => v.beerId != vote.beerId), vote];
  }
  return state.votes;
}
