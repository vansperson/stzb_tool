import 'package:flutter/material.dart';
import 'package:stzb_tool/models/general/general_detail_model.dart';
import 'package:stzb_tool/util/index.dart';

class SearchListWidget extends StatefulWidget {
  final List<GeneralDetailModel> list;
  final void Function(int id) onSelect;
  SearchListWidget({
    @required this.list,
    @required this.onSelect
  });

  @override
  _SearchListWidgetState createState() => _SearchListWidgetState();
}

class _SearchListWidgetState extends State<SearchListWidget> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(12.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.75
      ),
      itemCount: widget.list.length,
      itemBuilder: (BuildContext context, int index) {
        GeneralDetailModel item = widget.list[index];
        return SizedBox(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    child: PhysicalModel(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6.0),
                      clipBehavior: Clip.antiAlias,
                      child: Image.network('${Utils.baseAvatarUrl}${item.id}.jpg'),
                    ),
                  ),
                  Positioned(
                    left: 0.0,
                    right: 0.0,
                    bottom: 0.0,
                    child: Container(
                      alignment: Alignment.center,
                      color: Color.fromRGBO(0, 0, 0, 0.7),
                      height: 28.0,
                      child: Text(item.name, style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.white
                      ))
                    ),
                  )
                ],
              ),
              Container(
                alignment: Alignment.center,
                height: 30.0,
                width: 85.0,
                margin: const EdgeInsets.only(top: 15.0),
                decoration: BoxDecoration(
                  border: Border.all(width: 0.5, color: Color(0xff3fa1f7)),
                  borderRadius: BorderRadius.circular(15.0)
                ),
                child: InkWell(
                  onTap: () {
                    widget.onSelect(item.id);
                  },
                  child: Text('选择', style: TextStyle(
                    fontSize: 15.0,
                    color: Color(0xff1aa1f3)
                  ))
                )
              )
            ],
          )
        );
      }
    );
  }
}