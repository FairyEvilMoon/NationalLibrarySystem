class Book {
  final String id;
  final String title;
  final String authors;
  final String thumbnail;
  final String buyLink;
  final String price;

  Book(
      {required this.id,
      required this.title,
      required this.authors,
      required this.thumbnail,
      required this.buyLink,
      required this.price});

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'],
      title: json['volumeInfo']['title'],
      authors: json['volumeInfo']['authors']?.join(', ') ?? 'Unknown',
      thumbnail: json['volumeInfo']['imageLinks']['smallThumbnail'] ??
          'Image not found',
      buyLink: json['saleInfo']['buyLink'] ?? 'Not available for purchase',
      price: json['saleInfo']['retailPrice'],
    );
  }
}
