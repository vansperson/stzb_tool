import 'package:redux/redux.dart';
import 'package:redux_dev_tools/redux_dev_tools.dart';
import 'package:stzb_tool/models/app_state.dart';
import 'package:stzb_tool/redux/reducers.dart';

Future<Store<AppState>> createReduxStore() async {
  return DevToolsStore<AppState>(
    appStateReducers,
    initialState: AppState(),
  );
}