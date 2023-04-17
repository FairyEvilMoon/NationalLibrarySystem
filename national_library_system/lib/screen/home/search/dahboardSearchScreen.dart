import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:national_library_system/utils/ourTheme.dart';
import 'package:national_library_system/widgets/ourContainer.dart';
import 'package:national_library_system/models/bookModel.dart';
import '../localwidgets/componentHeader.dart';
import 'package:national_library_system/widgets/book_card.dart';
import 'package:http/io_client.dart';

class DashboardSearch extends StatefulWidget {
  const DashboardSearch({super.key, required this.headerText});
  final String headerText;

  @override
  State<DashboardSearch> createState() => _DashboardSearchState();
}

class _DashboardSearchState extends State<DashboardSearch> {
  String apikey = 'AIzaSyD6EUeGo1H0t4p9ZI585wGozAxAZ4jTxQ0';
  String searchString = '';
  late num pageNumber = 0;
  late List<Book> _books = [];
  late bool _haveBooks = false;
  late num _numResults;

  final _searchController = TextEditingController();

  double get screenWidth {
    return MediaQuery.of(context).size.width;
  }

  void _getSearchResults(num page) async {
    Uri url = Uri(
        scheme: 'https',
        host: 'www.googleapis.com',
        path: 'books/v1/volumes',
        query: 'q=' +
            searchString +
            '&maxResults=10&startIndex=' +
            pageNumber.toString() +
            '&key=' +
            apikey);
    final client = HttpClient();
    client.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    IOClient http = IOClient(client);
    await http.get(url).then(
      (response) async {
        if (response.statusCode == 200) {
          Map<String, dynamic> result = json.decode(response.body);
          var items = result['items'];
          for (var i = 0; i < items.length; i++) {
            var item = items[i];
            Book book = Book(item);
            _books.add(book);
          }
          _numResults = result['totalItems'];
          setState(() => _haveBooks = true);
        }
      },
    );
    pageNumber = pageNumber + 1;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              child: OurContainer(child: Header(widget.headerText, context)),
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        height: 40,
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 50,
                            width: screenWidth * 0.5,
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 2,
                                ),
                                child: TextField(
                                  controller: _searchController,
                                  autofocus: true,
                                  maxLength: 50,
                                  onSubmitted: (value) => {
                                    searchString = value,
                                    _books = [],
                                    _getSearchResults(0)
                                  },
                                ),
                              ),
                            ),
                          ),
                          OurContainer(
                            size: 0,
                            child: ElevatedButton(
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.search,
                                      color: Colors.black,
                                    ),
                                    Text(
                                      "Search",
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.black),
                                    ),
                                  ],
                                ),
                                onPressed: () {
                                  setState(() {
                                    searchString = _searchController.text;
                                    _books = [];
                                    _getSearchResults(0);
                                  });
                                }),
                          ),
                          Center(
                            child: SizedBox(
                              height: 530,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: OurContainer(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: !_haveBooks
                                        ? const Center(
                                            child: null,
                                          )
                                        : GridView.builder(
                                            gridDelegate:
                                                const SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: 5,
                                                    mainAxisSpacing: 5.0,
                                                    crossAxisSpacing: 2.0,
                                                    childAspectRatio: 2 / 3),
                                            itemCount: _books.length + 1,
                                            itemBuilder: (context, index) {
                                              if (index == 0) {
                                                return Card(
                                                  child: Center(
                                                    child: Text(
                                                      '   $_numResults \nResults',
                                                      style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.w900,
                                                        fontSize: 25.0,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              } else if (index ==
                                                  _books.length) {
                                                return Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    OurContainer(
                                                      size: 0,
                                                      child: ElevatedButton(
                                                        onPressed: () => {
                                                          pageNumber =
                                                              pageNumber + 1,
                                                          _getSearchResults(
                                                              pageNumber)
                                                        },
                                                        child: const Text(
                                                          'Load More',
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              }
                                              Card bookCard = BookCard(
                                                  _books[index], screenWidth);
                                              return bookCard;
                                            },
                                          ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
