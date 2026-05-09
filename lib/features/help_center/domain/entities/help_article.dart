import 'package:equatable/equatable.dart';

class HelpArticle extends Equatable {
  const HelpArticle({
    required this.id,
    required this.title,
    required this.summary,
    required this.category,
  });

  final String id;
  final String title;
  final String summary;
  final String category;

  @override
  List<Object?> get props => [id, title, summary, category];
}
