import 'dart:developer';

import 'package:alergo/theme/colors.dart';
import 'package:flutter/material.dart';

class ProfileTileList extends StatelessWidget {
  const ProfileTileList({
    this.imageUrl,
    this.label,
    Key key,
  })  : assert(label != null),
        assert(imageUrl != null),
        super(key: key);

  final String imageUrl;
  final String label;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(imageUrl, fit: BoxFit.contain),
      title: Text('$label'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.arrow_left, color: colorAccent),
          Icon(Icons.remove_circle_outline, color: colorAccent),
        ],
      ),
    );
  }
}
