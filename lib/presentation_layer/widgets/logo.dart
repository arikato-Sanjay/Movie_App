import 'package:flutter/material.dart';
import 'package:movie_app/common/extensions/size_extensions.dart';

class Logo extends StatelessWidget {
  final double height;

  const Logo({Key key, this.height})
      : assert(height != null, 'height cant be null'),
        assert(height > 0, 'height cant be smaller then 0'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/pngs/logo.png', color: Colors.white, height: height.h);
  }
}
