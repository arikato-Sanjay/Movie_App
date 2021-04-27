import 'package:flutter/material.dart';
import 'package:movie_app/common/constants/size_constants.dart';
import 'package:movie_app/common/constants/string_constants.dart';
import 'package:movie_app/domain_layer/entities/app_error.dart';
import 'package:movie_app/presentation_layer/widgets/app_buttons.dart';
import 'package:wiredash/wiredash.dart';
import 'package:movie_app/common/extensions/size_extensions.dart';

class AppLoadError extends StatelessWidget {
  final AppErrorType errorType;
  final Function onTap;

  const AppLoadError({Key key, @required this.errorType, @required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.size_32.w),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            errorType == AppErrorType.api
                ? StringConstants().wrong
                : StringConstants().network,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          ButtonBar(
            children: [
              AppButtons(title: 'Retry', onPressed: onTap),
              AppButtons(
                  title: 'Feedback',
                  onPressed: () => Wiredash.of(context).show())
            ],
          )
        ],
      ),
    );
  }
}
