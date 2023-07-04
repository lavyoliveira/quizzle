class Themes {
  final String id, theme, description;

  Themes({required this.id, required this.theme, required this.description});

  String get getId => id;
  String get getTheme => theme;
  String get getDescription => description;

  void setTheme(String theme) {
    theme = theme;
  }

  void setDescription(String description) {
    description = description;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'theme': theme,
      'description': description,
    };
  }
}
