import 'dart:convert';
import 'package:http/http.dart' as http;

class GoogleBooksApi {
  static const String _apiKey = 'API KEY HERE';
  static const String _baseUrl = 'https://www.googleapis.com/books/v1/volumes';

  Future<List<dynamic>> searchBooks(String query) async {
    final response = await http
        .get(Uri.parse('$_baseUrl?q=$query&maxResults=15&key=$_apiKey'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['items'] ?? [];
    } else {
      throw Exception('Failed to load books');
    }
  }
}
