import 'dart:developer';

import 'package:alergo/core/router.dart';
import 'package:alergo/models/product_model.dart';
import 'package:alergo/screens/product_page/product_page.dart';
import 'package:alergo/screens/scanner_page/scanner_page.dart';
import 'package:alergo/theme/colors.dart';
import 'package:alergo/theme/customs.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flappy_search_bar/search_bar_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/home';

  const HomePage({Key key}) : super(key: key);

  Future<List<ProductModel>> search(String search) async {
    return ProductModel.fromMock()
        .where((product) =>
            product.name.toUpperCase().contains(search.toUpperCase()) ||
            product.description.toUpperCase().contains(search.toUpperCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SearchBar<ProductModel>(
          onSearch: search,
          onItemFound: (ProductModel product, int index) {
            return ListTile(
              title: Text(product.name),
              subtitle: Text(product.description),
              onTap: () {
                navigateToRoute(
                  context,
                  ProductPage.routeName,
                  replace: true,
                  arguments: product,
                );
              },
            );
          },
          minimumChars: 1,
        ),
      ),

      // child: Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     Container(
      //       height: 100,
      //       child: SearchBar<ProductModel>(
      //         onSearch: search,
      //         onItemFound: (ProductModel product, int index) {
      //           return ListTile(
      //             title: Text(product.name),
      //             subtitle: Text(product.description),
      //           );
      //         },
      //       ),
      //     ),
      //     Container(
      //       decoration: dropShadow(
      //         color: colorSecondary,
      //         shape: BoxShape.circle,
      //       ),
      //       alignment: Alignment.center,
      //       child: ClipOval(
      //         child: Material(
      //           color: colorSecondary,
      //           child: InkWell(
      //             splashColor: colorPrimary,
      //             onTap: () => navigateToPage(context, ScannerPage()),
      //             child: AspectRatio(
      //               aspectRatio: 1 / 1,
      //               child: Padding(
      //                 padding: const EdgeInsets.all(42.0),
      //                 child: SvgPicture.asset(
      //                   'assets/qrcodescan.svg',
      //                   fit: BoxFit.contain,
      //                 ),
      //               ),
      //             ),
      //           ),
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
      // ),
    );
  }
}
