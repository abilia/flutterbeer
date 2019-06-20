import 'package:flutterbeer/model/app_model.dart';

import 'app_state.dart';

enum Actions { AddTasting, EditTasting }

class ActionPayload {
  ActionPayload(this.action, {this.data});
  Actions action;
  dynamic data;
}

AppState appReducer(AppState state, dynamic action) {
  switch (action.action) {
    case Actions.AddTasting:
      return AppState([action.data as BeerTasting,...state.tastings].toList());
    case Actions.EditTasting:
      final BeerTasting toBeEdited = action.data;
      final newTastings = state.tastings.toList();
      return AppState(newTastings..removeWhere((tasting) => tasting.id == toBeEdited.id)..add(toBeEdited));
    default:
  }
  return state;
}
