import 'package:flutterbeer/model/app_model.dart';

import 'app_state.dart';

enum Actions { AddTasting }

class ActionPayload {
  ActionPayload(this.action, {this.data});
  Actions action;
  dynamic data;
}

AppState appReducer(AppState state, dynamic action) {
  switch (action.action) {
    case Actions.AddTasting:
      return AppState([action.data as BeerTasting,...state.tastings].toList());
    default:
  }
  
  return state;
}
