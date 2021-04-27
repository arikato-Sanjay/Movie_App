import 'package:flutter/material.dart';
import 'package:movie_app/common/constants/size_constants.dart';
import 'package:movie_app/presentation_layer/themes/colors_theme.dart';
import 'package:movie_app/presentation_layer/themes/text_theme.dart';
import 'package:movie_app/common/extensions/size_extensions.dart';

class TabTitle extends StatelessWidget {
  final String title;
  final Function onTap;
  final isSelected;

  const TabTitle(
      {Key key,
      @required this.title,
      @required this.onTap,
      this.isSelected = false})
      : assert(title != null, 'title should not be null'),
        assert(onTap != null, 'onTap should not be null'),
        assert(isSelected != null, 'isSelected should not be null'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    color: isSelected ? ColorsTheme.royalBlue : Colors.transparent,
                    width: AppSizes.size_1.w
                )
            )
        ),
        child: Text(title,
            style: isSelected
                ? Theme.of(context).textTheme.royalBlueSubtitle1
                : Theme.of(context).textTheme.subtitle1),
      ),
    );
  }
}
