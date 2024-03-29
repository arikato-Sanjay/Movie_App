import 'package:movie_app/common/screen_utils/screen_utils.dart';

extension SizeExtension on num {
  num get w => ScreenUtil().setWidth(this);
  num get h => ScreenUtil().setHeight(this);
  num get sp => ScreenUtil().setSp(this);
}