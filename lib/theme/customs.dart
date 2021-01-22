import 'package:alergo/theme/colors.dart';
import 'package:flutter/material.dart';

dropShadow({
  Color color = colorWhite,
  BoxShape shape = BoxShape.rectangle,
}) =>
    BoxDecoration(
      color: color,
      shape: shape,
      borderRadius: shape == BoxShape.rectangle
          ? BorderRadius.all(
              Radius.circular(10),
            )
          : null,
      boxShadow: [
        BoxShadow(
          color: colorSecondary.withOpacity(0.5),
          spreadRadius: 5,
          blurRadius: 7,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ],
    );
