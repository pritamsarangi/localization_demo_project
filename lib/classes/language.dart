class Language{
  final int id;
  final String name;
  final String flag;
  final String languageCode;
  Language(this.id, this.name, this.flag, this.languageCode);
  
  static List<Language> languageList(){
    return<Language>[
      Language(1,'English','🇺🇸','en'),
      Language(2,'हिन्दी','🇮🇳','hi'),
      Language(3,'中国','🇨🇳','zh'),
      Language(4,'Deutschland','🇩🇪','de')
    ];
  }
}