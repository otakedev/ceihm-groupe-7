import 'package:alergo/mocks/profile_form_mock.dart';
import 'package:flutter/widgets.dart';

class ProfileFormModel {
  final String label;
  final String imageUrl;

  ProfileFormModel({
    @required this.label,
    @required this.imageUrl,
  })  : assert(label != null),
        assert(imageUrl != null);

  ProfileFormModel.fromMap(Map<String, dynamic> json)
      : label = json['label'],
        imageUrl = json['imageUrl'];

  Map<String, dynamic> toMap() => {
        "label": label,
        "imageUrl": imageUrl,
      };

  static List<ProfileFormModel> fromMock() => PROFILE_FORM_MOCK
      .map((model) => ProfileFormModel.fromMap(model))
      .toList();
}
