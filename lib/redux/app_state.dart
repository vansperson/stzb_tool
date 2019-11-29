
import 'package:stzb_tool/models/hero_item_model.dart';
import 'package:stzb_tool/redux/count_reducer.dart';

class AppState {
  int count;
  List<HeroItemModel> heroCast;
  
  AppState({
    this.heroCast,
    this.count
  });
}

AppState appReducer(AppState state, action) {
  return AppState(
    count: CountReducer(state.count, action)
  );
}