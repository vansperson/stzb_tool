import 'package:redux/redux.dart';
import 'package:redux_dev_tools/redux_dev_tools.dart';
import 'package:stzb_tool/models/cast/hero_cast_model.dart';
import 'package:stzb_tool/redux/app_state.dart';

Future<Store<AppState>> createReduxStore() async {
  HeroCastModel heroCast = HeroCastModel.fromJson({
    'camp': null,
    'central': null,
    'forward': null
  });
  return DevToolsStore<AppState>(
    appReducer,
    initialState: AppState(
      heroCast: heroCast
    ),
  );
}
