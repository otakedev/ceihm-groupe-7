import 'package:alergo/core/router.dart';
import 'package:alergo/models/product_model.dart';
import 'package:alergo/providers/product_history_provider.dart';
import 'package:alergo/screens/product_page/product_page.dart';
import 'package:alergo/screens/search_page/components/product_tile_list.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    final history = context.select<ProductHistoryProvider, List<ProductModel>>(
        (provider) => provider.retrieveLast(5));

    var searchBar = SearchBar<ProductModel>(
      emptyWidget: Center(
        child: Text("Aucun résultat"),
      ),
      hintText: "Rechercher",
      placeHolder: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(child: const Text('Dernières recherches')),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: history.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(10.0),
                child: _buildProductTileList(history[index], context),
              ),
            ),
          ),
        ],
      ),
      searchBarPadding: EdgeInsets.only(left: 50, right: 10),
      headerPadding: EdgeInsets.symmetric(horizontal: 10),
      listPadding: EdgeInsets.symmetric(horizontal: 10),
      cancellationWidget: Icon(Icons.cancel_rounded),
      minimumChars: 3,
      onSearch: _searchProduct,
      onItemFound: (ProductModel product, int index) =>
          _buildProductTileList(product, context),
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

  ProductTileList _buildProductTileList(
      ProductModel product, BuildContext context) {
    return ProductTileList(
      product: product,
      onTap: () => navigateToRoute(
        context,
        ProductPage.routeName,
        replace: true,
        arguments: product,
      ),
    );
  }
}
