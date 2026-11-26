class QuoteEntity {
  QuoteEntity({required this.id, required this.day, required this.quote});

  QuoteEntity.empty();

  String id = '';
  String day = '';
  String quote = '';
}
