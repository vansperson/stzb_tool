import 'package:redux/redux.dart';
import 'package:stzb_tool/models/general/general_detail_model.dart';
import 'package:stzb_tool/models/squads/squads_model.dart';
import 'package:stzb_tool/util/enum.dart';

final squadsReducer = combineReducers<SquadsModel>([
  TypedReducer<SquadsModel, AddGeneral>(_addGeneral)
]);

SquadsModel _addGeneral(SquadsModel squads, action) {
  if(action.site == GeneralSiteEnum.camp.index) {
    squads.camp = action.general;
  } else if(action.site == GeneralSiteEnum.central.index) {
    squads.central = action.general;
  } else if(action.site == GeneralSiteEnum.forward.index) {
    squads.forward = action.general;
  }

  return squads;
}

class AddGeneral {
  final GeneralDetailModel general;
  final int site;

  AddGeneral({ this.general, this.site });
}