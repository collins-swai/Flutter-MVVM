import 'package:flutter/cupertino.dart';
import 'package:mvvm_in_lutter/res/strings/EnglishStrings.dart';
import 'package:mvvm_in_lutter/res/strings/FrenchStrings.dart';
import 'package:mvvm_in_lutter/res/strings/Strings.dart';

import 'colors/Appcolors.dart';
import 'dimensions/AppDimensions.dart';

class Resources {
  BuildContext _context;

  Resources(this._context);

  Strings get strings {
    Locale locale = Localizations.localeOf(_context);
    switch (locale.languageCode) {
      case 'fr':
        return FrenchStrings();
      default:
        return EnglishStrings();
    }
  }

  AppColors get color {
    return AppColors();
  }

  AppDimension get dimension {
    return AppDimension();
  }

  static Resources of(BuildContext context) {
    return Resources(context);
  }
}
