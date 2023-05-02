import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:national_library_system/models/bookModel.dart';
import '../services/google_books_api.dart';

class BookProvider extends ChangeNotifier {
  List<Book> _books = [];
  List<String> _bookmarks = [];

  List<Book> get books => _books;
  List<String> get bookmarks => _bookmarks;

  Future<List<Book>> searchBooks(String query) async {
    final api = GoogleBooksApi();
    final items = await api.searchBooks(query);
    _books = items.map((item) => Book.fromJson(item)).toList();
    notifyListeners();
    return _books;
  }

  void toggleBookmark(String id) {
    if (_bookmarks.contains(id)) {
      _bookmarks.remove(id);
    } else {
      _bookmarks.add(id);
    }
    saveBookmarks();
    notifyListeners();
  }

  void loadBookmarks() async {
    final prefs = await SharedPreferences.getInstance();
    _bookmarks = prefs.getStringList('bookmarks') ?? [];
    notifyListeners();
  }

  void saveBookmarks() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList('bookmarks', _bookmarks);
  }
}
