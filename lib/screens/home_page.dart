import 'package:alergo/core/router.dart';
import 'package:alergo/screens/scanner_page/scanner_page.dart';
import 'package:alergo/screens/search_page/search_page.dart';
import 'package:alergo/theme/colors.dart';
import 'package:alergo/theme/customs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home';

  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          iconSize: 50,
          color: colorSecondaryText,
          icon: Icon(Icons.supervised_user_circle_outlined),
          onPressed: () => {},
        ),
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: dropShadow(
            color: colorSecondary,
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: ClipOval(
            child: Material(
              color: colorSecondary,
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
            ),
          ),
        ),
      ),
    );
  }
}
