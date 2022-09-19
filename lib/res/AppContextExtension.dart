import 'package:flutter/cupertino.dart';
import 'package:mvvm_in_lutter/res/Resources.dart';

extension AppContext on BuildContext {
  Resources get resources => Resources.of(this);
}
