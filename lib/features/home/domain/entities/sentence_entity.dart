import 'package:equatable/equatable.dart';

class SentenceEntity extends Equatable {
  const SentenceEntity({
    required this.sentence,
    required this.date,
    required this.isLiked,
  });

  final String sentence;
  final DateTime date;
  final bool isLiked;

  @override
  List<Object> get props => [sentence, date, isLiked];
}
