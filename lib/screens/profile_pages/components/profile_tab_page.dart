import 'package:alergo/models/profile_item_block_model.dart';
import 'package:alergo/screens/profile_pages/components/profile_item_block.dart';
import 'package:alergo/providers/profile_selector_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProfileTabPage extends StatelessWidget {
  const ProfileTabPage({
    Key key,
    this.label,
    @required this.items,
    @required this.profileType,
  })  : assert(profileType != null),
        super(key: key);

  final String label;
  final List<ProfileItemBlockModel> items;
  final ProfileType profileType;

  @override
  Widget build(BuildContext context) {
    final double bottomPadding = MediaQuery.of(context).size.width * 0.2;
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
            Flexible(
              child: Padding(
                padding: EdgeInsets.only(bottom: bottomPadding),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: MediaQuery.of(context).size.width * 0.05,
                    mainAxisSpacing: MediaQuery.of(context).size.height * 0.02,
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
            ),
          ],
        ),
      ),
    );
  }
}
