
class NewspaperModel {
  final String title;
  final String placeOfPublication;
  final int startYear;
  final int endYear;
  final String publisher;
  final String frequency;
  final String url;
  final List<String> subjects;
  final List<String> cities;
  final List<String> languages;
  final List<String> notes;

  NewspaperModel({
    required this.title,
    required this.placeOfPublication,
    required this.startYear,
    required this.endYear,
    required this.publisher,
    required this.frequency,
    required this.url,
    required this.subjects,
    required this.cities,
    required this.languages,
    required this.notes,
  });

  factory NewspaperModel.fromJson(Map<String, dynamic> json) {
    return NewspaperModel(
      title: json['title'] ?? '',
      placeOfPublication: json['place_of_publication'] ?? '',
      startYear: json['start_year'] ?? 0,
      endYear: json['end_year'] ?? 0,
      publisher: json['publisher'] ?? '',
      frequency: json['frequency'] ?? '',
      url: json['url'] ?? '',
      subjects: List<String>.from(json['subject'] ?? []),
      cities: List<String>.from(json['city'] ?? []),
      languages: List<String>.from(json['language'] ?? []),
      notes: List<String>.from(json['note'] ?? []),
    );
  }
}
