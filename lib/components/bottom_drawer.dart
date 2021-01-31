import 'package:alergo/theme/colors.dart';
import 'package:alergo/theme/style.dart';
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

  final MenuAction leftAction;
  final MenuAction rightAction;
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
    return LayoutBuilder(
      builder: _buildStack,
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
        // Removed for now because if takes the whole screen
        // GestureDetector(
        //   onTap: () => _drawerController.reverse(),
        // ),
        PositionedTransition(
          rect: drawerAnimation,
          child: PhysicalModel(
            color: colorSecondaryText,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(borderRadius),
              topRight: Radius.circular(borderRadius),
            ),
            clipBehavior: Clip.antiAlias,
            elevation: 4,
            child: Container(
              color: colorSecondary,
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
    final _leftAction = this.widget.leftAction;
    final _rightAction = this.widget.rightAction;

    return Container(
      height: drawerMarge,
      child: IntrinsicWidth(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: 8),
            Expanded(
              child: Container(
                height: drawerMarge - 20,
                child: _leftAction != null
                    ? RaisedButton(
                        color: _leftAction.color,
                        onPressed: () => {
                          _drawerController.reverse(),
                          _leftAction.onAction()
                        },
                        child: Text(
                          _leftAction.text,
                          textAlign: TextAlign.center,
                        ),
                      )
                    : const SizedBox.shrink(),
              ),
            ),
            Expanded(
              child: this.widget.menuWidgets != null
                  ? FlatButton(
                      onPressed: () => _bottomDrawerOpened
                          ? _drawerController.reverse()
                          : _drawerController.forward(),
                      child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        alignment: WrapAlignment.center,
                        children: [
                          Text(
                            '${_bottomDrawerOpened ? this.widget.drawerOpenedText : this.widget.drawerClosedText}',
                          ),
                          RotationTransition(
                            turns: iconAnimation,
                            child: Icon(Icons.arrow_drop_down),
                          )
                        ],
                      ),
                    )
                  : const SizedBox(),
            ),
            Expanded(
              child: Container(
                height: drawerMarge - 20,
                child: _rightAction != null
                    ? RaisedButton(
                        color: _rightAction.color,
                        onPressed: () => {
                          _drawerController.reverse(),
                          _rightAction.onAction()
                        },
                        child: Text(
                          _rightAction.text,
                          textAlign: TextAlign.center,
                        ),
                      )
                    : const SizedBox.shrink(),
              ),
            ),
            SizedBox(width: 8),
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

class MenuAction {
  final String text;
  final VoidCallback onAction;
  final Color color;

  MenuAction({
    @required this.text,
    @required this.onAction,
    this.color = colorPrimary,
  });
}
