class PostModel {
  final String name;
  final String capital;
  final List<String> languages;
  final String flag;

  PostModel({
    required this.name,
    required this.capital,
    required this.languages,
    required this.flag,
  });

  // Factory method to create an instance of PostModel from JSON
  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      name: json['name']['common'],
      capital: json['capital'] != null ? json['capital'][0] : 'No Capital',
      languages: json['languages'] != null
          ? List<String>.from(json['languages'].values)
          : [],
      flag: json['flags']['png'],
    );
  }
}
