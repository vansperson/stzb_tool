import 'package:equatable/equatable.dart';
import 'package:stzb_tool/models/hero_item_model.dart';

class AddHeroAction extends Equatable {
  final HeroItemModel heroItem;

  AddHeroAction(this.heroItem);

  @override
  List<Object> get props => [heroItem];
}

class AddCount extends Equatable {
  final int count;

  AddCount(this.count);

  @override
  List<Object> get props => [count];
}