// Flutter
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// Internal
import 'package:alergo/core/router.dart';
import 'package:alergo/components/item_block.dart';

// Pages
import '../home_page.dart';

class EndOfProfileFormPage extends StatefulWidget {
  @override
  _EndOfProfileFormPageState createState() => _EndOfProfileFormPageState();
}

class _EndOfProfileFormPageState extends State<EndOfProfileFormPage> {
  List<int> selectedIndexes = [];
  // List<ProductItemModel> diets =
  //     PRODUCT_ITEMS_MOCK.map((e) => new ProductItemModel.fromMap(e)).toList(); // TODO

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(children: [
        Text(
            'Votre profil est complet. Vous pouvez le modifier à tout moment (Icone ...).'),
        RaisedButton(
          onPressed: () => navigateToPage(context, HomePage()),
          child: Text("Aller à la page principale"),
        ),
      ]),
    ));
  }
}
