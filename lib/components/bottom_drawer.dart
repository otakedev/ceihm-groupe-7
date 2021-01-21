import 'dart:developer';

import 'package:alergo/theme/colors.dart';
import 'package:flutter/material.dart';

enum ActionPosition { top, bottom }

///
///Widget to include in a stack widget
///
class BottomDrawer extends StatefulWidget {
  BottomDrawer({
    this.leftAction,
    this.rightAction,
    this.menuWidgets,
    this.actionPosition = ActionPosition.bottom,
    this.drawerOpenedText = "Fermer",
    this.drawerClosedText = "Ouvrir",
    Key key,
  }) : super(key: key);

  final Widget leftAction;
  final Widget rightAction;
  final Widget menuWidgets;
  final String drawerOpenedText;
  final String drawerClosedText;
  final ActionPosition actionPosition;

  @override
  _BottomDrawerState createState() => _BottomDrawerState();
}

class _BottomDrawerState extends State<BottomDrawer>
    with TickerProviderStateMixin {
  AnimationController _drawerController;
  Animation<double> _drawerCurve;

  bool _addMarginToDrawer = false;

  bool get _bottomDrawerOpened {
    final status = _drawerController.status;
    return status == AnimationStatus.completed ||
        status == AnimationStatus.forward;
  }

  @override
  void initState() {
    super.initState();
    _drawerController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
      value: 0,
    )..addListener(() {
        if (_drawerController.value >= 0.95) {
          setState(() => _addMarginToDrawer = true);
        } else if (_drawerController.value <= 0.95) {
          setState(() => _addMarginToDrawer = false);
        }
      });
    _drawerCurve = CurvedAnimation(
      parent: _drawerController,
      curve: standardEasing,
      reverseCurve: standardEasing.flipped,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: LayoutBuilder(
          builder: _buildStack,
        ),
      ),
    );
  }

  Stack _buildStack(BuildContext context, BoxConstraints constraints) {
    final drawerSize = constraints.biggest;
    final drawerTop = drawerSize.height;
    final drawerMarge = ((drawerTop / 100) * 10);

    final drawerAnimation = RelativeRectTween(
      begin: RelativeRect.fromLTRB(0.0, drawerTop - drawerMarge, 0.0, 0.0),
      end: RelativeRect.fromLTRB(0.0, drawerMarge, 0.0, 0.0),
    ).animate(_drawerCurve);

    final iconAnimation = Tween(
      begin: 0.0,
      end: 0.5,
    ).animate(_drawerCurve);

    return Stack(
      children: [
        GestureDetector(
          onTap: () => _drawerController.reverse(),
        ),
        PositionedTransition(
          rect: drawerAnimation,
          child: Container(
            decoration: BoxDecoration(
              color: colorSecondary,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25.0),
                topRight: Radius.circular(25.0),
              ),
            ),
            child: Column(
              children: (() {
                if (this.widget.actionPosition == ActionPosition.top) {
                  return [
                    _buildActions(drawerMarge, iconAnimation),
                    _buildMenu()
                  ];
                } else {
                  return [
                    AnimatedSize(
                      vsync: this,
                      duration: Duration(milliseconds: 100),
                      child: SizedBox(height: _addMarginToDrawer ? 30 : 0),
                    ),
                    _buildMenu(),
                    _buildActions(drawerMarge, iconAnimation),
                  ];
                }
              })(),
            ),
          ),
        )
      ],
    );
  }

  Expanded _buildMenu() {
    return Expanded(
      child: this.widget.menuWidgets ?? const SizedBox.shrink(),
    );
  }

  Widget _buildActions(double drawerMarge, Animation<double> iconAnimation) {
    return Container(
      height: drawerMarge,
      child: IntrinsicWidth(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: this.widget.leftAction ?? const SizedBox(),
            ),
            Expanded(
              child: FlatButton(
                  onPressed: () => _bottomDrawerOpened
                      ? _drawerController.reverse()
                      : _drawerController.forward(),
                  child: Row(
                    children: [
                      Text(
                        '${_bottomDrawerOpened ? this.widget.drawerOpenedText : this.widget.drawerClosedText}',
                      ),
                      RotationTransition(
                        turns: iconAnimation,
                        child: Icon(Icons.arrow_drop_down),
                      )
                    ],
                  )),
            ),
            Expanded(
              child: this.widget.rightAction ?? const SizedBox(),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _drawerController.dispose();
    super.dispose();
  }
}
