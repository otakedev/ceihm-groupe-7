import 'package:alergo/core/router.dart';
import 'package:alergo/models/product_model.dart';
import 'package:alergo/screens/scanner_page/scanner_page.dart';
import 'package:alergo/theme/colors.dart';
import 'package:alergo/theme/customs.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/home';

  const HomePage({Key key}) : super(key: key);

  Future<List<ProductModel>> search(String search) async {
    return ProductModel.fromMock();
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
            );
          },
        ),
        // child: Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [

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
      ),
    );
  }
}
