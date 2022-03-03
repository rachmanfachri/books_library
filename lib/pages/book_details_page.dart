import 'package:flutter/material.dart';
import 'package:google_books_library/widgets/book_details_widgets.dart';

// ignore: must_be_immutable
class BookDetailsPage extends StatefulWidget {
  BookDetailsPage({Key? key, required this.bookDetails}) : super(key: key);

  // ignore: prefer_typing_uninitialized_variables
  var bookDetails;

  @override
  State<BookDetailsPage> createState() => _BookDetailsPageState();
}

class _BookDetailsPageState extends State<BookDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back_ios_rounded, color: Colors.blue[900]),
        ),
        leadingWidth: kToolbarHeight,
        title: const Text('Search Book'),
        foregroundColor: Colors.blue[900],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            bookDetailsHeading(
              context,
              widget.bookDetails.volumeInfo.imageLinks.thumbnail,
              widget.bookDetails.volumeInfo.title,
              widget.bookDetails.volumeInfo.subtitle,
              widget.bookDetails.saleInfo.listPrice.currencyCode + ' ' + widget.bookDetails.saleInfo.listPrice.amount.toString(),
              widget.bookDetails.volumeInfo.authors.join(', '),
              widget.bookDetails.volumeInfo.categories.join(', '),
              widget.bookDetails.volumeInfo.publisher + ' • ' + widget.bookDetails.volumeInfo.publishedDate,
              widget.bookDetails.volumeInfo.averageRating,
              widget.bookDetails.volumeInfo.ratingsCount,
              widget.bookDetails.volumeInfo.previewLink,
              widget.bookDetails.saleInfo.buyLink,
            ),
            const SizedBox(height: 20),
            bookDescription(widget.bookDetails.volumeInfo.description)
          ],
        ),
      ),
    );
  }
}
