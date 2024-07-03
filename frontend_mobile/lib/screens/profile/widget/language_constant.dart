List<Language> langList = [
  khmer(),
  English(),
  // Chinese(),
  // Japanese(),
];

class Language {
  String get language => "Language";
  String get Engish => "English";
  String get Spanish => "Spanish";
  String get French => "French";
  String get German => "German";
  String get Chinese => "Chinese";
  String get Japanese => "Japanese";
  String get Korean => "Korean";
  String get Khmer => "Khmer";
}

class English implements Language {
  String get language => "Language";
  String get Engish => "English";
  String get Spanish => "Spanish";
  String get French => "French";
  String get German => "German";
  String get Chinese => "Chinese";
  String get Japanese => "Japanese";
  String get Korean => "Korean";
  String get Khmer => "Khmer";
}

class khmer implements Language {
  String get language => "ភាសា";
  String get Engish => "ភាសាអង់គ្លេស";
  String get Spanish => "ភាសាអេស្ប៉ាញ";
  String get French => "ភាសាបារាំង";
  String get German => "ភាសាអាឡឺម៉ង់";
  String get Chinese => "ភាសាចិន";
  String get Japanese => "ភាសាជប៉ុន";
  String get Korean => "ភាសាកូរ៉េ";
  String get Khmer => "ភាសាខ្មែរ";
}

// class Chinese implements Language {
//   String get appName => "柬埔寨语应用";
//   String get detailScreen => "详细屏幕";
//   String get toSystemMode => "进入系统模式";
//   String get toLightMode => "转为亮光模式";
//   String get toDarkMode => "进入暗黑模式";
//   String get theme => "主题";
//   String get language => "语言";
//   String get settings => "环境";
// }

// class Japanese implements Language {
//   String get appName => "クメール語アプリ";
//   String get detailScreen => "詳細画面";
//   String get toSystemMode => "システムモードへ";
//   String get toLightMode => "ライトモードへ";
//   String get toDarkMode => "ダークモードへ";
//   String get theme => "テーマ";
//   String get language => "言語";
//   String get settings => "設定";
// }