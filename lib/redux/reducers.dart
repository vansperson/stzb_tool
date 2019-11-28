import 'package:stzb_tool/models/app_state.dart';
import 'package:stzb_tool/models/hero_item_model.dart';
import 'package:stzb_tool/redux/actions.dart';

AppState appStateReducers (AppState state, dynamic action) {
  if(action is AddHeroAction) {
    return addHero(state.heroCast, action);
  }
  if(action is AddCount) {
    return addCount(state.count, action);
  }

  return state;
}

AppState addHero(List<HeroItemModel> heroCast, AddHeroAction action) {
  return AppState(heroCast: heroCast..add(action.heroItem));
}

AppState addCount(int count, AddCount action) {
  return AppState(count: action.count);
}