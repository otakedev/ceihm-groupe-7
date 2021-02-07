import 'package:alergo/core/router.dart';
import 'package:alergo/core/text_style.dart';
import 'package:alergo/models/product_model.dart';
import 'package:alergo/models/user_model.dart';
import 'package:alergo/providers/product_history_provider.dart';
import 'package:alergo/providers/profile_selector_provider.dart';
import 'package:alergo/screens/product_page/components/product_compatibility.dart';
import 'package:alergo/screens/product_page/components/product_details.dart';
import 'package:alergo/screens/profile_pages/profile_page.dart';
import 'package:alergo/screens/scanner_page/scanner_page.dart';
import 'package:alergo/screens/search_page/search_page.dart';
import 'package:alergo/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatelessWidget {
  static const routeName = '/product';

  const ProductPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // POUR LES PHASES DE DEV , NE PAS SUPPRIMER
    // final ProductModel product =
    //     ProductModel.fromMock().firstWhere((e) => "1" == e.id);
    final ProductModel product = ModalRoute.of(context).settings.arguments;
    context.read<ProductHistoryProvider>().add(product);

    return Scaffold(
      body: Consumer<ProfileSelectorProvider>(
        builder: (context, profileSelector, child) {
          final UserModel user = profileSelector.getModel();
          final validity = verifyIngredientsValidity(product.ingredients, user);
          return ProductDetails(
            product: product,
            color: validity.color ?? colorSecondary,
            compatibilityWidget: _buildProductValidityWidget(validity, context),
            forEachCheckValidity: (ingredient) =>
                verifyIngredientsValidity([ingredient], user),
          );
        },
      ),
      floatingActionButton: QuickSearchTools(),
    );
  }

  _buildProductValidityWidget(ValidityState validity, BuildContext context) {
    switch (validity.state) {
      case ProductValidity.good:
        return ProductCompatibility(
          color: validity.color,
          title: 'Compatible',
          leading: Icon(
            validity.icon,
            color: colorWhite,
          ),
        );
      case ProductValidity.warning:
        return ProductCompatibility(
          color: validity.color,
          title: 'Incompatible',
          leading: Icon(
            validity.icon,
            color: colorWhite,
          ),
        );
      case ProductValidity.forbidden:
        return ProductCompatibility(
          color: validity.color,
          title: 'Attention',
          leading: Icon(
            validity.icon,
            color: colorWhite,
          ),
        );
      default:
        return GestureDetector(
          onTap: () => navigateToRoute(context, ProfilePage.routeName),
          child: ProductCompatibility(
            title:
                'Définissez votre profil pour recevoir des notifications détaillées',
            elevation: 8.0,
            textstyle: bodyText1White(context),
            leading: Icon(
              Icons.arrow_forward,
              color: colorWhite,
            ),
          ),
        );
    }
  }
}

class QuickSearchTools extends StatelessWidget {
  const QuickSearchTools({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          heroTag: 'search',
          mini: true,
          child: Icon(Icons.search),
          onPressed: () =>
              navigateToRoute(context, SearchBarPage.routeName, replace: true),
        ),
        FloatingActionButton(
          heroTag: 'scan',
          child: SvgPicture.asset(
            'assets/qrcodescan.svg',
            color: colorWhite,
            fit: BoxFit.contain,
          ),
          onPressed: () =>
              navigateToPage(context, ScannerPage(), replace: true),
        ),
      ],
    );
  }
}
