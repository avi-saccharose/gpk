class Quote {
  final String quote;
  final String author;
  Quote({required this.quote, required this.author});

  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
      quote: json['quote'] as String,
      author: json['author'] as String,
    );
  }
}
