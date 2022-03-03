import 'package:flutter/material.dart';
import 'package:google_books_library/pages/book_details_page.dart';
import 'package:google_books_library/pages/opening_page.dart';

bookListTile(BuildContext context, List bookList) {
  double thumbnailHeight = screenWidth / 5;
  double thumbnailWidth = thumbnailHeight * (2.5 / 3);

  return SizedBox(
    height: screenHeight,
    child: ListView(
      children: [
        for (int i = 0; i < bookList.length; i++)

          // card body
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => BookDetailsPage(bookDetails: bookList[i])));
              },
              child: Container(
                width: screenWidth,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color.fromARGB(137, 186, 214, 236),
                  borderRadius: BorderRadius.circular(15),
                ),

                // card contents
                child: Row(
                  children: [
                    // thumbnail
                    SizedBox(
                      height: thumbnailHeight,
                      width: thumbnailWidth,
                      child: Image.network(
                        bookList[i].volumeInfo.imageLinks.thumbnail,
                        height: thumbnailHeight,
                        fit: BoxFit.fitHeight,
                      ),
                    ),

                    // displayable volume info
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      width: screenWidth * (2 / 3),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // book title
                          Text(
                            bookList[i].volumeInfo.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                          ),

                          // book authors
                          Text(
                            bookList[i].volumeInfo.authors.join(', '),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: Colors.blue[900]),
                          ),

                          // publishing info
                          Row(
                            children: [
                              Text(bookList[i].volumeInfo.publisher),
                              const Text(' • '),
                              Text(
                                bookList[i].volumeInfo.publishedDate,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),

                          // rating
                          Row(
                            children: [
                              Icon(
                                Icons.star_rounded,
                                color: bookList[i].volumeInfo.ratingsCount > 0 ? Colors.amber : Colors.black12,
                                size: 14,
                              ),
                              Text(
                                bookList[i].volumeInfo.averageRating.toStringAsFixed(
                                    bookList[i].volumeInfo.averageRating.truncateToDouble() == bookList[i].volumeInfo.averageRating ? 0 : 1),
                                style: const TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
      ],
    ),
  );
}
