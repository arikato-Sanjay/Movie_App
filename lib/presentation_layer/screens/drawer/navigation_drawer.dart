import 'package:flutter/material.dart';
import 'package:movie_app/common/constants/size_constants.dart';
import 'package:movie_app/common/constants/string_constants.dart';
import 'package:movie_app/common/extensions/size_extensions.dart';
import 'package:movie_app/presentation_layer/screens/drawer/navigation_list.dart';
import 'package:movie_app/presentation_layer/widgets/about_dialog.dart';
import 'package:movie_app/presentation_layer/widgets/logo.dart';
import 'package:wiredash/wiredash.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Theme.of(context).primaryColor.withOpacity(0.8),
            blurRadius: 4)
      ]),
      width: AppSizes.size_300.w,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: AppSizes.size_8.h,
                  bottom: AppSizes.size_18.h,
                  left: AppSizes.size_8.w,
                  right: AppSizes.size_8.w),
              child: Logo(
                height: AppSizes.size_20.h,
              ),
            ),
            NavigationList(title: 'Favourite Movie', onTap: () {}),
            NavigationList(
                title: 'Feedback',
                onTap: () {
                  Navigator.of(context).pop();
                  Wiredash.of(context).show();
                }),
            NavigationList(
                title: 'About ',
                onTap: () {
                  Navigator.of(context).pop();
                  _showDialog(context);
                })
          ],
        ),
      ),
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
        context: context,
        child: AboutDialogs(
          title: StringConstants().title,
          description: StringConstants().description,
          buttonText: StringConstants().buttonText,
          image: Image.asset(
            'assets/pngs/tmdb_logo.png',
            height: AppSizes.size_32.h,
          ),
        ));
  }
}
