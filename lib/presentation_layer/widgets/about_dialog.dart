import 'package:flutter/material.dart';
import 'package:movie_app/common/constants/size_constants.dart';
import 'package:movie_app/presentation_layer/themes/colors_theme.dart';
import 'package:movie_app/common/extensions/size_extensions.dart';
import 'package:movie_app/presentation_layer/widgets/app_buttons.dart';

class AboutDialogs extends StatelessWidget {
  final title, description, buttonText;
  final Widget image;

  const AboutDialogs(
      {Key key,
      @required this.title,
      @required this.description,
      @required this.buttonText,
      this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
        backgroundColor: ColorsTheme.vulcan,
        elevation: AppSizes.size_32,
        insetPadding: EdgeInsets.all(AppSizes.size_32.w),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(AppSizes.size_8.w))),
        child: Container(
          padding: EdgeInsets.only(
              top: AppSizes.size_4.h,
              left: AppSizes.size_16.w,
              right: AppSizes.size_16.w),
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(color: ColorsTheme.vulcan, blurRadius: AppSizes.size_16)
          ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.headline5,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: AppSizes.size_6.h,
                ),
                child: Text(
                  description,
                  style: Theme.of(context).textTheme.bodyText2,
                  textAlign: TextAlign.center,
                ),
              ),
              if (image != null) image,
              AppButtons(
                  title: buttonText,
                  onPressed: () {
                    Navigator.of(context).pop();
                  })
            ],
          ),
        ));
  }
}
