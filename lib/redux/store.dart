import 'package:redux/redux.dart';
import 'package:redux_dev_tools/redux_dev_tools.dart';
import 'package:stzb_tool/redux/app_state.dart';

Future<Store<AppState>> createReduxStore() async {
  return DevToolsStore<AppState>(
    appReducer,
    initialState: AppState(
      count: 0,
      heroCast: []
    ),
  );
}