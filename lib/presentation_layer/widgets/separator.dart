import 'package:flutter/material.dart';
import 'package:movie_app/common/constants/size_constants.dart';
import 'package:movie_app/common/extensions/size_extensions.dart';
import 'package:movie_app/presentation_layer/themes/colors_theme.dart';

class Separator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSizes.size_1.h,
      width: AppSizes.size_80.w,
      padding: EdgeInsets.only(
        top: AppSizes.size_2.h,
        bottom: AppSizes.size_6.h,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(AppSizes.size_1.h)),
        gradient: LinearGradient(
          colors: [
            ColorsTheme.violet,
            ColorsTheme.royalBlue,
          ],
        ),
      ),
    );
  }
}