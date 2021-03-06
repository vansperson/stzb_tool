import 'package:flutter/material.dart';
import 'package:stzb_tool/models/filtrate/general_filtrate_option_model.dart';


class DropSelectWidget extends StatefulWidget {
  final String name;
  final bool hasDrop; 
  DropSelectWidget({
    @required this.name,
    @required this.hasDrop
  });

  @override
  _DropSelectWidgetState createState() => _DropSelectWidgetState();
}

class _DropSelectWidgetState extends State<DropSelectWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            widget.name, style: TextStyle(
            color: widget.hasDrop ? Color(0xff1aa1f3) : Color(0xff647686),
            fontSize: 15.0
          )),
          Icon(
            widget.hasDrop ? Icons.arrow_drop_up : Icons.arrow_drop_down, 
            color: widget.hasDrop ? Color(0xff1aa1f3) : Color(0xff647686)
          )
        ],
      ),
    );
  }
}

class SelectOptionsWidget extends StatefulWidget {
  final List<GeneralFiltrateOptionModel> options;
  final void Function(GeneralFiltrateOptionModel option) onSelect;

  SelectOptionsWidget({@required this.options, @required this.onSelect});
  @override
  _SelectOptionsWidgetState createState() => _SelectOptionsWidgetState();
}

class _SelectOptionsWidgetState extends State<SelectOptionsWidget> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.spaceBetween,
      runSpacing: 12.0,
      children: widget.options.map((f) {
        return InkWell(
          onTap: () {
            widget.onSelect(f);
          },
          child: Container(
            alignment: Alignment.center,
            width: 120.0,
            height: 35.0,
            decoration: BoxDecoration(
              color: Color(0xffe6edf1),
              borderRadius: BorderRadius.circular(18.0)
            ),
            child: Text(f.label, style: TextStyle(
              color: Color(0xff131519),
              fontSize: 15.0
            )),
          )
        );
      }).toList()
    );
  }
}