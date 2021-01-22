import 'dart:async';

import 'package:flutter/material.dart';

class AnimatedTileList extends StatefulWidget {
  const AnimatedTileList({
    Key key,
    @required this.color,
    @required this.item,
  }) : super(key: key);

  final Color color;
  final Widget item;

  @override
  _AnimatedTileListState createState() => _AnimatedTileListState();
}

class _AnimatedTileListState extends State<AnimatedTileList> {
  StreamController<bool> controller = StreamController<bool>.broadcast();

  Stream stream;

  @override
  void initState() {
    stream = controller.stream;
    super.initState();
  }

  @override
  void dispose() {
    controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: stream,
      initialData: false,
      builder: (context, snapshot) {
        return Listener(
          onPointerDown: (point) => {
            controller.add(true),
          },
          onPointerUp: (point) => {
            controller.add(false),
          },
          child: AnimatedContainer(
            duration: Duration(milliseconds: 100),
            decoration: BoxDecoration(
              color: snapshot.data
                  ? this.widget.color.withOpacity(0.95)
                  : this.widget.color,
              borderRadius: snapshot.data
                  ? BorderRadius.all(
                      Radius.circular(25.0),
                    )
                  : null,
            ),
            child: this.widget.item,
          ),
        );
      },
    );
  }
}
