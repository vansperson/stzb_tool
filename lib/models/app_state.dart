
import 'package:stzb_tool/models/hero_item_model.dart';

class AppState {
  int count = 0;
  List<HeroItemModel> heroCast;
  AppState({
    this.heroCast,
    this.count
  });

  AppState.fromJson(Map<String, dynamic> json) {
    heroCast = (json['cartItems'] as List)?.map((i) {
      return new HeroItemModel.fromJson(i as Map<String, dynamic>);
    })?.toList();
    count = json['count'];
  }
  
  Map<String, dynamic> toJson() => {
    'heroCast': heroCast,
    'count': count
  };
}
