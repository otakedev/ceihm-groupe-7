import 'package:alergo/core/router.dart';
import 'package:alergo/screens/scanner_page/scanner_page.dart';
import 'package:alergo/theme/colors.dart';
import 'package:alergo/theme/customs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'profile_pages/choose_diet_page/choose_diet_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: dropShadow(
                color: kColorSecondary,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: ClipOval(
                child: Material(
                  color: kColorSecondary,
                  child: InkWell(
                    splashColor: kColorPrimary,
                    onTap: () => navigateToPage(context, ScannerPage()),
                    child: AspectRatio(
                      aspectRatio: 1 / 1,
                      child: Padding(
                        padding: const EdgeInsets.all(42.0),
                        child: SvgPicture.asset(
                          'assets/qrcodescan.svg',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            RaisedButton(
              onPressed: () => navigateToPage(context, ChooseDietPage()),
              child: Text("Définir votre profil"),
            ),
          ],
        ),
      ),
    );
  }
}
