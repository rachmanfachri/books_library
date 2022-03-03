import 'package:flutter/foundation.dart';
import 'package:google_books_library/models/book.dart';
import 'package:http/http.dart' as http;

class Webservice {
  fetchBookData(String keyword) async {
    final url = 'https://www.googleapis.com/books/v1/volumes?q=$keyword';

    return await http.get(Uri.parse(url)).then(
      (response) {
        if (response.statusCode == 200) {
          return bookFromJson(response.body);
        } else {
          if (kDebugMode) {
            print('connection error');
          }
          return false;
        }
      },
    );
  }
}
