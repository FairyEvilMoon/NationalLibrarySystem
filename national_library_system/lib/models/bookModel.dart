class Book {
  final String id;
  final String title;
  final String authors;
  final String thumbnail;
  final String buyLink;

  Book({
    required this.id,
    required this.title,
    required this.authors,
    required this.thumbnail,
    required this.buyLink,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'],
      title: json['volumeInfo']['title'],
      authors: json['volumeInfo']['authors']?.join(', ') ?? 'Unknown',
      thumbnail: json['volumeInfo']['imageLinks']['smallThumbnail'] ??
          'Image not found',
      buyLink: json['saleInfo']['buyLink'] ?? 'non',
    );
  }
}
