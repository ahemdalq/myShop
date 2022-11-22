import 'package:get/get.dart';
import 'package:myshop_app/language/fr.dart';

import '../utils/my_string.dart';
import 'ar.dart';
import 'en.dart';

class LocaliztionApp extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        ene: en,
        ara: ar,
        frf: fr,
      };
}
