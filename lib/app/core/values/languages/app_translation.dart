import 'dart:ui';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../utils/app_storage.dart';
import '../app_strings.dart';
import 'from/ar_sy_translations.dart';
import 'from/en_us_translations.dart';

class AppTranslation extends Translations {

  static Locale get arabicLocale => Locale(AppStrings.arabicLang,AppStrings.arabicCountry);
  static Locale get englishLocale => Locale(AppStrings.englishLang,AppStrings.englishCountry);

  static get getDirection => isEnglish ? TextDirection.ltr:TextDirection.rtl;

  static Locale getLocale() {
    final String tag = AppStorage.read(AppStorage.LANGUAGE_KEY) ?? AppStrings.arabic;
    final locale = Locale(tag.split('_').first, tag.split('_').last);
    return locale;
  }

  static bool get isEnglish {
    return (getLocale().languageCode == "en") || (Get.locale!.languageCode.split('_').first == AppStrings.englishLang);
  }

  static bool get isArabic {
    return (getLocale().languageCode == AppStrings.arabicLang) || (Get.locale!.languageCode.split('_').first == AppStrings.arabicLang);
  }

  Future saveLocale(Locale locale) async{
    await AppStorage.write(AppStorage.LANGUAGE_KEY, '${locale.languageCode}_${locale.countryCode}');
    Get.updateLocale(locale);
  }

  @override
  Map<String, Map<String, String>> get keys => {
        AppStrings.arabic: arSY,
        AppStrings.english: enUs,
      };
}
