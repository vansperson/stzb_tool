import 'package:redux/redux.dart';

final countReducer = combineReducers<int>(
  [TypedReducer<int, UpdateCountAction>(_updateCount)]
);

int _updateCount(int count, action) {
  count = count + 1;
  return count;
}

class UpdateCountAction {}