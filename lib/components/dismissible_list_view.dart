import 'package:alergo/components/animated_tile_list.dart';
import 'package:alergo/theme/colors.dart';
import 'package:flutter/material.dart';

///
/// this widget need a scaffold parent for the undo operation
///
class DismissibleListView extends StatefulWidget {
  DismissibleListView({
    this.widgets = const [],
    this.snackbarContent = const Text("1 Choix enlevé"),
    this.snackBarActionLabel = "Annuler",
    this.onWidgetRemoved,
    this.onWidgetUndo,
    this.secondaryColor = colorWarn,
    this.mainColor = colorSecondary,
    this.backgroundIcon = const Icon(Icons.delete_outline, color: colorWhite),
    this.undo = true,
    Key key,
  }) : super(key: key);

  final List<Widget> widgets;
  final Color secondaryColor;
  final Color mainColor;
  final Widget backgroundIcon;
  final Widget snackbarContent;
  final Function(int removedIndex) onWidgetRemoved;
  final Function(int undoIndex) onWidgetUndo;
  final String snackBarActionLabel;
  final bool undo;

  @override
  _DismissibleListViewState createState() => _DismissibleListViewState();
}

class _DismissibleListViewState extends State<DismissibleListView> {
  @override
  Widget build(BuildContext context) {
    final _items = this.widget.widgets;
    Widget deletedWidget;

    return Container(
      child: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (contect, index) {
          final Widget item = _items[index];

          return Container(
            color: this.widget.secondaryColor,
            child: Dismissible(
              background: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: this.widget.backgroundIcon,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 25),
                    child: this.widget.backgroundIcon,
                  ),
                ],
              ),
              key: UniqueKey(),
              onDismissed: (direction) {
                setState(() {
                  deletedWidget = _items.removeAt(index);
                  if (this.widget.onWidgetRemoved != null) {
                    this.widget.onWidgetRemoved(index);
                  }
                });

                Scaffold.of(context)
                  ..removeCurrentSnackBar()
                  ..showSnackBar(
                    SnackBar(
                      content: this.widget.snackbarContent,
                      action: SnackBarAction(
                        label: this.widget.snackBarActionLabel,
                        onPressed: () => setState(() {
                          _items.insert(index, deletedWidget);
                          if (this.widget.onWidgetUndo != null) {
                            this.widget.onWidgetUndo(index);
                          }
                        }),
                      ),
                    ),
                  );
              },
              child: AnimatedTileList(color: this.widget.mainColor, item: item),
            ),
          );
        },
      ),
    );
  }
}
