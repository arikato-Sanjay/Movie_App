import 'package:flutter/material.dart';
import 'package:movie_app/common/constants/size_constants.dart';
import 'package:movie_app/common/extensions/size_extensions.dart';

class MovieDetailAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back_ios_outlined,
            color: Colors.white,
            size: AppSizes.size_12.h,
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Icon(
            Icons.favorite_border_outlined,
            color: Colors.white,
            size: AppSizes.size_12.h,
          ),
        )
      ],
    );
  }
}
