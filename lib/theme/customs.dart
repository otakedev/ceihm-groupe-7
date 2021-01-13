import 'package:alergo/theme/colors.dart';
import 'package:flutter/material.dart';

dropShadow({
  Color color = kColorWhite,
  BoxShape shape,
}) =>
    BoxDecoration(
      color: color,
      shape: shape ?? null,
      borderRadius: shape == null
          ? BorderRadius.all(
              Radius.circular(10),
            )
          : null,
      boxShadow: [
        BoxShadow(
          color: kColorSecondary.withOpacity(0.5),
          spreadRadius: 5,
          blurRadius: 7,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ],
    );
