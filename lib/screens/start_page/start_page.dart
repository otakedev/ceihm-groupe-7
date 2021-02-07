import 'package:alergo/core/router.dart';
import 'package:alergo/core/text_style.dart';
import 'package:alergo/screens/home_page.dart';
import 'package:alergo/screens/profile_pages/profile_page.dart';
import 'package:alergo/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StartPage extends StatelessWidget {
  static final routeName = '/start';

  @override
  Widget build(BuildContext context) {
    var _buildNavigationButtons = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
          child: RaisedButton(
            color: colorWhite,
            padding: const EdgeInsets.only(
              top: 12.0,
              left: 24.0,
              bottom: 12.0,
              right: 24.0,
            ),
            onPressed: () => navigateToRoute(context, ProfilePage.routeName),
            child: Container(
              width: double.infinity,
              child: Text(
                "Définir votre profil",
                style: headline4(context).apply(color: colorPrimary),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
          child: RaisedButton(
            padding: const EdgeInsets.only(
              top: 12.0,
              left: 24.0,
              bottom: 12.0,
              right: 24.0,
            ),
            onPressed: () => navigateToRoute(context, HomePage.routeName),
            child: Container(
              width: double.infinity,
              child: Text(
                "Commencer à \nscanner",
                style: headline4White(context),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ],
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text("ALERGO"),
        elevation: 0,
      ),
      body: Stack(
        children: [
          SvgPicture.asset(
            'assets/welcome.svg',
            width: double.infinity,
            fit: BoxFit.fitWidth,
            alignment: Alignment.bottomCenter,
          ),
          Align(
            alignment: Alignment(1, -0.5),
            child: LayoutBuilder(
              builder: (context, constraint) => Container(
                width: double.infinity,
                height: constraint.maxHeight / 2,
                child: _buildNavigationButtons,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
