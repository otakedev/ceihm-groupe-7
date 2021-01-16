import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ItemBlock extends StatefulWidget {
  final String itemName;
  final String assetPath;
  final int index;
  final bool isSelected;
  final VoidCallback onSelect;
  final VoidCallback onDeselect;

  const ItemBlock(
      {Key key,
      @required this.itemName,
      @required this.assetPath,
      @required this.index,
      @required this.isSelected,
      @required this.onSelect,
      @required this.onDeselect})
      : assert(index != null),
        assert(isSelected != null),
        assert(onSelect != null),
        assert(onDeselect != null),
        super(key: key);

  @override
  _ItemBlockState createState() => _ItemBlockState();
}

class _ItemBlockState extends State<ItemBlock> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.isSelected ? widget.onDeselect : widget.onSelect,
      child: Card(
          child: Padding(
            padding: EdgeInsets.only(top: 8),
            child: Column(children: [
              Expanded(
                child: Image.asset(
                  widget.assetPath,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(widget.itemName),
              )
            ]),
          ),
          color: widget.isSelected
              ? ThemeData().accentColor
              : ThemeData().cardColor),
    );
  }
}
