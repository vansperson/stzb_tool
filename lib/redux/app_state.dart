
import 'package:stzb_tool/models/cast/hero_cast_model.dart';
import 'package:stzb_tool/redux/cast_reducer.dart';

class AppState {
  HeroCastModel heroCast;
  
  AppState({
    this.heroCast
  });
}

AppState appReducer(AppState state, action) {
  return AppState(
    heroCast: castReducer(state.heroCast, action),
  );
}