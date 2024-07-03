// import 'package:flutter/material.dart';

// import 'language_constant.dart';

// class LanguageLogic extends ChangeNotifier {
//   int _langIndex = 0;
//   int get langIndex => _langIndex;

//   Language _lang = Khmer();
//   Language get lang => _lang;

//   void changeToKhmer() {
//     _langIndex = 0;
//     _lang = langList[_langIndex];
//     notifyListeners();
//   }

//   void changeToEnglish() {
//     _langIndex = 1;
//     _lang = langList[_langIndex];
//     notifyListeners();
//   }

//   // void changeToChinese() {
//   //   _langIndex = 2;
//   //   _lang = langList[_langIndex];
//   //   notifyListeners();
//   // }

//   // void changeToJapanese() {
//   //   _langIndex = 3;
//   //   _lang = langList[_langIndex];
//   //   notifyListeners();
//   // }
// }

import 'package:flutter/material.dart';
import 'language_constant.dart';

class LanguageLogic extends ChangeNotifier {
  int _langIndex = 0;
  int get langIndex => _langIndex;

  Language _lang = khmer();
  Language get lang => _lang;

  void changeToKhmer() {
    if (_langIndex != 0) {
      _langIndex = 0;
      _lang = langList[_langIndex];
      notifyListeners();
    }
  }

  void changeToEnglish() {
    if (_langIndex != 1) {
      _langIndex = 1;
      _lang = langList[_langIndex];
      notifyListeners();
    }
  }
}
