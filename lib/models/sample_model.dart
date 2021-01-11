import 'package:flutter/widgets.dart';

class Sample {
  final String id;

  Sample({@required this.id}) : assert(id != null);

  Sample.fromMap(Map<String, dynamic> json) : id = json['id'];

  Map<String, dynamic> toMap() => {
        "id": id,
      };
}
