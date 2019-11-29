import 'package:redux/redux.dart';

final CountReducer = combineReducers<int>(
  [TypedReducer<int, UpdateCountAction>(_updateCount)]
);

int _updateCount(int count, action) {
  count = action.count;
  return count;
}

class UpdateCountAction {
  final int count;

  UpdateCountAction(this.count);
}