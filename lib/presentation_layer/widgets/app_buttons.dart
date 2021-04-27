import 'package:flutter/material.dart';
import 'package:movie_app/common/constants/size_constants.dart';
import 'package:movie_app/presentation_layer/themes/colors_theme.dart';
import 'package:movie_app/common/extensions/size_extensions.dart';

class AppButtons extends StatelessWidget {
  final String title;
  final Function onPressed;

  const AppButtons({Key key, @required this.title, @required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [ColorsTheme.royalBlue, ColorsTheme.violet]),
          borderRadius: BorderRadius.all(Radius.circular(AppSizes.size_20.w))),
      padding: EdgeInsets.symmetric(horizontal: AppSizes.size_16.w),
      margin: EdgeInsets.symmetric(vertical: AppSizes.size_10.h),
      height: AppSizes.size_16.h,
      child: FlatButton(
          onPressed: onPressed,
          child: Text(
            title,
            style: Theme.of(context).textTheme.button,
          )),
    );
  }
}
