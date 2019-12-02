
import 'package:stzb_tool/models/filtrate/general_filtrate_model.dart';

var generalList = [
  {
    'key': 'quality',
    'label': '星级',
    'options': [
      {'value': '', 'label': '全部'},
      {'value': '0-C', 'label': '一星'},
      {'value': '1-C', 'label': '二星'},
      {'value': '2-UC', 'label': '三星'},
      {'value': '3-R', 'label': '四星'},
      {'value': '4-SR', 'label': '五星'}
    ]
  }, {
    'key': 'contory',
    'label': '阵营',

    'options': [
      {'value': '', 'label': '全部'},
      {'value': '汉', 'label': '汉'},
      {'value': '群', 'label': '群'},
      {'value': '蜀', 'label': '蜀'},
      {'value': '魏', 'label': '魏'},
      {'value': '吴', 'label': '吴'}
    ]
  }, {
    'key': 'type',
    'label': '兵种',
    'options': [
      {'value': '', 'label': '全部'},
      {'value': '弓', 'label': '弓兵'},
      {'value': '骑', 'label': '骑兵'},
      {'value': '步', 'label': '步兵'}
    ]
  }, {
    'key': 'cost',
    'label': 'Cost',
    'options': [
      {'value': '', 'label': '全部'},
      {'value': '5.5', 'label': '5.5'},
      {'value': '4', 'label': '4'},
      {'value': '3.5', 'label': '3.5'},
      {'value': '3', 'label': '3'},
      {'value': '2.5', 'label': '2.5'},
      {'value': '2', 'label': '2'},
      {'value': '1.5', 'label': '1.5'},
      {'value': '1', 'label': '1'},
    ]
  }
];

List<GeneralFiltrateModel> filtrategeneral = generalList.map((f) {
  return GeneralFiltrateModel.fromJson(f);
}).toList();

