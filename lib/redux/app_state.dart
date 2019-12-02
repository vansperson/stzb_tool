

import 'package:stzb_tool/models/squads/squads_model.dart';
import 'package:stzb_tool/redux/squads_reducer.dart';

class AppState {
  SquadsModel squads;
  
  AppState({
    this.squads
  });
}

AppState appReducer(AppState state, action) {
  return AppState(
    squads: squadsReducer(state.squads, action),
  );
}