import 'package:alergo/theme/colors.dart';
import 'package:flutter/material.dart';

headline1(context) => Theme.of(context).textTheme.headline1;
headline2(context) => Theme.of(context).textTheme.headline2;
headline3(context) => Theme.of(context).textTheme.headline3;
headline4(context) => Theme.of(context).textTheme.headline4;
headline5(context) => Theme.of(context).textTheme.headline5;
headline6(context) => Theme.of(context).textTheme.headline6;
bodyText1(context) => Theme.of(context).textTheme.bodyText1;
bodyText2(context) => Theme.of(context).textTheme.bodyText2;

headline1White(context) =>
    Theme.of(context).textTheme.headline1.apply(color: colorWhite);
headline2White(context) =>
    Theme.of(context).textTheme.headline2.apply(color: colorWhite);
headline3White(context) =>
    Theme.of(context).textTheme.headline3.apply(color: colorWhite);
headline4White(context) =>
    Theme.of(context).textTheme.headline4.apply(color: colorWhite);
headline5White(context) =>
    Theme.of(context).textTheme.headline5.apply(color: colorWhite);
headline6White(context) =>
    Theme.of(context).textTheme.headline6.apply(color: colorWhite);
bodyText1White(context) =>
    Theme.of(context).textTheme.bodyText1.apply(color: colorWhite);
bodyText1Black(context) => Theme.of(context)
    .textTheme
    .bodyText1
    .apply(color: Colors.black.withOpacity(0.75), fontSizeFactor: 1.3);
bodyText2Black(context) => Theme.of(context)
    .textTheme
    .bodyText2
    .apply(color: Colors.black.withOpacity(0.75), fontSizeFactor: 1.2);
bodyText2White(context) =>
    Theme.of(context).textTheme.bodyText2.apply(color: colorWhite);
