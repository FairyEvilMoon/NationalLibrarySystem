import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:national_library_system/widgets/ourContainer.dart';
import 'package:national_library_system/models/bookModel.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../providers/book_provider.dart';
import '../localwidgets/componentHeader.dart';

class DashboardSearch extends StatefulWidget {
  const DashboardSearch({super.key, required this.headerText});
  final String headerText;

  @override
  State<DashboardSearch> createState() => _DashboardSearchState();
}

class _DashboardSearchState extends State<DashboardSearch> {
  final _searchController = TextEditingController();
  List<Book> _books = [];
  double get screenWidth {
    return MediaQuery.of(context).size.width;
  }

  void searchBooks(String query) async {
    List<Book> fetchedBooks =
        await Provider.of<BookProvider>(context, listen: false)
            .searchBooks(query);
    setState(() {
      _books = fetchedBooks;
    });
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<BookProvider>(context);
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
                                  onSubmitted: (value) {
                                    setState(() {
                                      searchBooks(value);
                                    });
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
                                    (query) {
                                      Provider.of<BookProvider>(context,
                                              listen: false)
                                          .searchBooks(query);
                                    };
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
                                    child: _books.isEmpty
                                        ? Center(child: Text('No Books Found'))
                                        : GridView.builder(
                                            gridDelegate:
                                                SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: 5,
                                                    mainAxisSpacing: 5.0,
                                                    crossAxisSpacing: 2.0,
                                                    childAspectRatio: 2 / 3),
                                            itemCount: _books.length,
                                            itemBuilder: (context, index) {
                                              final book = _books[index];
                                              return GestureDetector(
                                                onTap: () {
                                                  // Display the book details here
                                                },
                                                child: Container(
                                                  margin: EdgeInsets.all(8),
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color: Colors.grey[300]!,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Expanded(
                                                        child: Stack(
                                                          children: [
                                                            Center(
                                                              child:
                                                                  Image.network(
                                                                book.thumbnail,
                                                                fit: BoxFit
                                                                    .contain,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.all(8),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              book.title,
                                                              maxLines: 2,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                            SizedBox(height: 4),
                                                            Text(
                                                              book.authors,
                                                              maxLines: 1,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .grey[600],
                                                              ),
                                                            ),
                                                            SizedBox(height: 4),
                                                            InkWell(
                                                              onTap: () =>
                                                                  _launchURL(book
                                                                      .buyLink),
                                                              child: Text(
                                                                'Buy',
                                                                style:
                                                                    TextStyle(
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          255,
                                                                          1,
                                                                          1),
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                      IconButton(
                                                        onPressed: () {
                                                          // Handle the bookmark feature here
                                                        },
                                                        icon: Icon(
                                                          Icons
                                                              .bookmark_outline,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
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
