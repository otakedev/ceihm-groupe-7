import 'package:alergo/models/label_model.dart';
import 'package:flutter/material.dart';

class ProductLabels extends StatelessWidget {
  const ProductLabels({
    Key key,
    @required this.labels,
  }) : super(key: key);

  final List<LabelModel> labels;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: labels.length,
          itemBuilder: (BuildContext context, int index) {
            return Tooltip(
              message: labels[index].description,
              child: Container(
                  constraints: BoxConstraints(
                      minHeight: 100,
                      minWidth: MediaQuery.of(context).size.width * 0.22),
                  child: Center(
                    child: Image.asset(labels[index].assetPath,
                        height: 80, width: 80),
                  )),
            );
          }),
    );
  }
}
