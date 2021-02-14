import 'package:alergo/core/text_style.dart';
import 'package:alergo/theme/colors.dart';
import 'package:alergo/theme/style.dart';
import 'package:flutter/material.dart';

class TitleBar extends StatelessWidget {
  const TitleBar({
    @required this.title,
    Key key,
  }) : super(key: key);

  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      constraints: BoxConstraints(minHeight: 40),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        color: colorSecondary,
      ),
      child: Center(
        child: Text(title, style: bodyText1Black(context)),
      ),
    );
  }
}
