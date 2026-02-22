class SentenceModel {
  const SentenceModel({
    required this.sentence,
    required this.date,
    required this.isLiked,
  });

  factory SentenceModel.fromJson(Map<String, dynamic> json) => SentenceModel(
        sentence: json['sentence'] as String,
        date: json['date'] as String,
        isLiked: json['isLiked'] as bool,
      );

  final String sentence;
  final String date;
  final bool isLiked;
}
