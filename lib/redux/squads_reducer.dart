import 'package:redux/redux.dart';
import 'package:stzb_tool/models/squads/squads_model.dart';

final squadsReducer = combineReducers<SquadsModel>([
  TypedReducer<SquadsModel, AddGeneral>(_addGeneral)
]);

SquadsModel _addGeneral(SquadsModel squads, action) {
  return squads;
}

class AddGeneral {
  final int id;
  final int position;

  AddGeneral({this.id, this.position});
}