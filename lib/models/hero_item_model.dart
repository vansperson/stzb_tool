import 'package:stzb_tool/models/hero_skill_model.dart';

class HeroItemModel {
  String name;
  String avatarId;
  List<HeroSkillModel> skills;
  HeroItemModel.fromJson(Map<dynamic, dynamic> json) {
    name = json['name'];
    avatarId = json['avatarId'];
    skills = json['avatarId'];

    if(json['skills'] != null) {
      skills = new List<HeroSkillModel>();
      json["buttonList"].forEach((v){
        HeroSkillModel skill = HeroSkillModel.fromJson(v);
        skills.add(skill);
      });
    }
  }

  String toString() {
    return "$name: $avatarId";
  }
}