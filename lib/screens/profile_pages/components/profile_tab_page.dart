import 'package:alergo/models/profile_item_block_model.dart';
import 'package:alergo/screens/profile_pages/components/profile_item_block.dart';
import 'package:alergo/screens/profile_pages/profile_selector_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProfileTabPage extends StatelessWidget {
  const ProfileTabPage({
    Key key,
    this.label = "",
    @required this.items,
    @required this.profileType,
    @required this.pageController,
  })  : assert(profileType != null),
        assert(pageController != null),
        super(key: key);

  final String label;
  final List<ProfileItemBlockModel> items;
  final ProfileType profileType;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05)
            .copyWith(bottom: 0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text(
                label,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            Flexible(
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
            SizedBox(height: 80)
          ],
        ),
      ),
    );
  }
}
