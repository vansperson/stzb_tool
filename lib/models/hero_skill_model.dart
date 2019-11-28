class HeroSkillModel {
  String name;
  String skillId;
  
  HeroSkillModel.fromJson(Map<dynamic, dynamic> json) {
    name = json['name'];
    skillId = json['avatarId'];
  }

  String toString() {
    return "$name: $skillId";
  }
}