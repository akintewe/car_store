import 'package:car_marketplace_ui/models/filter_model.dart';
import 'package:flutter/material.dart';

String filterHint = 'price,low to high';
class PopupNestedMenu extends StatefulWidget {
  const PopupNestedMenu({Key? key, required this.filterModel})
      : super(key: key);

  final List<FilterModel> filterModel;

  @override
  _PopupNestedMenuState createState() => _PopupNestedMenuState();
}

class _PopupNestedMenuState extends State<PopupNestedMenu> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
// This menu button widget updates a _selection field (of type String,
// not shown here).
    return PopupMenuButton<String>(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        width: screenSize.width * 0.7,
        child: DropdownButtonFormField(
          isExpanded: true,
            isDense: true,
            hint: Text(
              filterHint,
              style: Theme.of(context).textTheme.headline6!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis
                  ),
            ),
            items: null,
            onChanged: (_) {},
            decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.pinkAccent, width: 2)))),
      ),
      itemBuilder: (_) => <PopupMenuEntry<String>>[
        PopupMenuItem<String>(
          value: widget.filterModel[0].title,
          child: SubMenu(widget.filterModel[0]),
        ),
        PopupMenuItem<String>(
          value: widget.filterModel[1].title,
          child: SubMenu(widget.filterModel[1]),
        ),
      ],
    );
  }
}

class SubMenu extends StatefulWidget {
  final FilterModel filterModel;
  const SubMenu(this.filterModel, {Key? key}) : super(key: key);

  @override
  _SubMenuState createState() => _SubMenuState();
}

class _SubMenuState extends State<SubMenu> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return PopupMenuButton<String>(
      child: Row(
        children: <Widget>[
          Text(widget.filterModel.title),
          const Spacer(),
          const Icon(Icons.arrow_right, size: 30.0),
        ],
      ),
      onCanceled: () {
        if (Navigator.canPop(context)) {
          Navigator.pop(context);
        }
      },
      onSelected: (String result) {
        setState((){
          filterHint='${widget.filterModel.title}, $result';
        });
      },
      // how much the submenu should offset from parent. This seems to have an upper limit.
      offset: Offset(screenSize.width * 0.26, 0),
      itemBuilder: (BuildContext context) => widget.filterModel.usbFilters!
          .map(
            (e) => PopupMenuItem<String>(
              value: e.title,
              child: Text(e.title),
            ),
          )
          .toList(),
    );
  }
}
