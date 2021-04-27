import 'package:flutter/foundation.dart';

class Tab {
  final String title;
  final int index;

  const Tab({@required this.title, @required this.index})
      : assert(title != null, 'title should not be null'),
        assert(index >= 0, 'index cant be less than 0');
}
