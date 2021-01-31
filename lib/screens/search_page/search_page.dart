import 'package:alergo/core/router.dart';
import 'package:alergo/models/product_model.dart';
import 'package:alergo/screens/product_page/product_page.dart';
import 'package:alergo/screens/search_page/components/product_tile_list.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter/material.dart';

class SearchBarPage extends StatelessWidget {
  static const routeName = '/search';

  const SearchBarPage({
    Key key,
  }) : super(key: key);

  Future<List<ProductModel>> _searchProduct(String search) async {
    return ProductModel.fromMock()
        .where(
          (product) =>
              product.name.toUpperCase().contains(search.toUpperCase()),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    var searchBar = SearchBar<ProductModel>(
      emptyWidget: Center(
        child: Text("Aucun résultat"),
      ),
      hintText: "Rechercher",
      searchBarPadding: EdgeInsets.only(left: 50, right: 10),
      headerPadding: EdgeInsets.symmetric(horizontal: 10),
      listPadding: EdgeInsets.symmetric(horizontal: 10),
      cancellationWidget: Icon(Icons.cancel_rounded),
      minimumChars: 3,
      onSearch: _searchProduct,
      onItemFound: (ProductModel product, int index) => ProductTileList(
        product: product,
        onTap: () => navigateToRoute(
          context,
          ProductPage.routeName,
          replace: true,
          arguments: product,
        ),
      ),
    );

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            searchBar,
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () => navigateBackFromPage(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
