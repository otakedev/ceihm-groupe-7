// Flutter
// Internal
import 'package:alergo/core/router.dart';
import 'package:alergo/core/text_style.dart';
import 'package:alergo/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProfileFinalTabPage extends StatelessWidget {
  const ProfileFinalTabPage({
    @required this.text,
    Key key,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              Icons.check_circle,
              color: colorSecondary,
              size: 200,
            ),
            Text(
              "Profil Complet",
              textAlign: TextAlign.center,
              style: headline4(context),
            ),
            RaisedButton(
              padding: const EdgeInsets.only(
                top: 12.0,
                left: 24.0,
                bottom: 12.0,
                right: 24.0,
              ),
              onPressed: () => navigateToRoute(context, '/home'),
              child: Text(
                "Terminer !",
                style: headline4White(context),
              ),
            ),
            Text(
              text,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20)
          ],
        ),
      ),
    );
  }
}
