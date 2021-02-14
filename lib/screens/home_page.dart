import 'package:alergo/core/router.dart';
import 'package:alergo/core/text_style.dart';
import 'package:alergo/providers/profile_selector_provider.dart';
import 'package:alergo/screens/profile_pages/profile_page.dart';
import 'package:alergo/screens/profile_pages/update_profile_page.dart';
import 'package:alergo/screens/scanner_page/scanner_page.dart';
import 'package:alergo/screens/search_page/search_page.dart';
import 'package:alergo/theme/colors.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home';

  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;

    var _qrCodeWidget = ClipOval(
      child: InkWell(
        splashColor: colorPrimary,
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
    );

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Consumer<ProfileSelectorProvider>(
            builder: (context, profileSelector, child) {
          if (profileSelector.getModel().isNotSet()) {
            return Badge(
              position: BadgePosition.topStart(top: 6, start: 6),
              badgeContent: Icon(Icons.add, color: colorWhite, size: 12),
              child: _buildUpdateProfile(context, ProfilePage.routeName),
            );
          }
          return _buildUpdateProfile(context, UpdateProfilePage.routeName);
        }),
        title: Text('ALERGO'),
        actions: [
          IconButton(
            iconSize: 50,
            color: colorSecondaryText,
            icon: Icon(Icons.search),
            onPressed: () => navigateToRoute(context, SearchBarPage.routeName),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: PhysicalModel(
            color: colorSecondary,
            shape: BoxShape.circle,
            elevation: 8.0,
            child: Container(
              height: _width - 16.0, // padding top and bottom
              width: _width,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment(0.0, 0.7),
                    child: Text("SCANNER", style: bodyText1Black(context)),
                  ),
                  _qrCodeWidget,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  IconButton _buildUpdateProfile(BuildContext context, String route) {
    return IconButton(
      iconSize: 50,
      color: colorSecondaryText,
      icon: Icon(Icons.supervised_user_circle_outlined),
      onPressed: () => navigateToRoute(context, route),
    );
  }
}
