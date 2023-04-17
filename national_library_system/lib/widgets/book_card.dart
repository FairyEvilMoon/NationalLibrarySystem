import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/bookModel.dart';

class BookCard extends Card {
  BookCard(Book book, double screenWidth, {Key? key})
      : super(
            key: key,
            elevation: 15,
            margin: const EdgeInsets.all(10),
            child: getContent(book, screenWidth));
}

Future<void> launchInBrowser(String url) async {
  if (!await launch(
    url,
    forceWebView: false,
  )) {
    throw 'Could not launch $url';
  }
}

String trimString(String strToTrim, [int trimLimit = 40]) {
  if (strToTrim.length > trimLimit) {
    return '${strToTrim.substring(0, trimLimit)}...';
  }
  return strToTrim;
}

Widget getContent(Book book, double screenlWidth) {
  return Container(
    child: Column(
      children: [
        SizedBox(
          height: 50,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                book.title,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              (book.thumbnail == 'Thumbnail not found')
                  ? Text(
                      book.thumbnail,
                    )
                  : Image(
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                      image: NetworkImage(
                        book.thumbnail,
                      ),
                    ),
              SelectableText(
                book.price,
              ),
              InkWell(
                child: Text(
                  book.buyLink == '' ? '' : 'Buy',
                  style: const TextStyle(
                    color: Colors.red,
                  ),
                ),
                onTap: () => launchInBrowser(
                  book.buyLink,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
