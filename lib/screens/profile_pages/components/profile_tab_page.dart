import 'package:alergo/models/profile_item_model.dart';
import 'package:alergo/screens/profile_pages/components/profile_item_block.dart';
import 'package:alergo/providers/profile_selector_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';

class ProfileTabPage extends StatelessWidget {
  const ProfileTabPage({
    Key key,
    this.label,
    @required this.items,
    @required this.profileType,
  })  : assert(profileType != null),
        super(key: key);

  final String label;
  final List<ProfileItemModel> items;
  final ProfileType profileType;

  Future<List<ProfileItemModel>> _searchItem(String search) async {
    return items
        .where(
          (element) =>
              element.name.toUpperCase().contains(search.toUpperCase()),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final responsiveWidth = MediaQuery.of(context).size.width * 0.05;
    final responsiveHeight = MediaQuery.of(context).size.height * 0.02;
    final double bottomPadding = MediaQuery.of(context).size.width * 0.2;

    var searchBar = SearchBar<ProfileItemModel>(
      emptyWidget: Center(
        child: Text("Aucun résultat"),
      ),
      hintText: "Rechercher",
      searchBarPadding: EdgeInsets.only(left: 10, right: 10, bottom: 0),
      headerPadding: EdgeInsets.symmetric(horizontal: 10),
      listPadding: EdgeInsets.symmetric(horizontal: 10),
      cancellationWidget: Icon(Icons.cancel_rounded),
      minimumChars: 3,
      onSearch: _searchItem,
      onItemFound: (ProfileItemModel profile, int index) {
        return ProfileItemBlock(
          item: profile,
          type: profileType,
        );
      },
      crossAxisCount: 2,
      crossAxisSpacing: responsiveWidth,
      mainAxisSpacing: responsiveHeight,
      shrinkWrap: true,
      placeHolder: Padding(
        padding: EdgeInsets.only(bottom: bottomPadding),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: responsiveWidth,
            mainAxisSpacing: responsiveHeight,
          ),
          shrinkWrap: true,
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            return ProfileItemBlock(
              item: items[index],
              type: profileType,
            );
          },
        ),
      ),
    );

    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05,
        ),
        child: Column(
          children: [
            if (label != null)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  label,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            Flexible(child: searchBar)
          ],
        ),
      ),
    );
  }
}
