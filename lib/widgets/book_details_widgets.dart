// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_books_library/pages/opening_page.dart';
import 'package:google_books_library/widgets/snackbar.dart';
import 'package:url_launcher/url_launcher.dart';

_previewOrBuyBook(String link, BuildContext context) async {
  if (await canLaunch(link)) {
    await launch(link);
  } else {
    showSnackbar(context: context, content: 'Can\'t open link', isError: true);
  }
}

bookDetailsHeading(
  BuildContext context,
  String thumbnail,
  String title,
  String subtitle,
  String price,
  String author,
  String categories,
  String publisher,
  double ratingAmount,
  int ratingCount,
  String previewLink,
  String buyLink,
) {
  double thumbnailHeight = screenWidth * (3 / 4);
  double thumbnailWidth = thumbnailHeight * (2.5 / 3);

  return Container(
    width: screenWidth,
    padding: const EdgeInsets.all(20),
    margin: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: const Color.fromARGB(175, 186, 214, 236),
      borderRadius: BorderRadius.circular(15),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // book title
        Container(
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.only(bottom: 5),
          decoration: BoxDecoration(color: Colors.white38, borderRadius: BorderRadius.circular(15)),
          alignment: Alignment.center,
          child: Text(
            title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ),

        // book subtitle
        Text(
          subtitle,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: subtitle.isNotEmpty ? 5 : 0),

        // price
        Text(
          price,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.green[700]),
        ),
        const SizedBox(height: 10),

        // thumbnail
        SizedBox(
          height: thumbnailHeight,
          width: thumbnailWidth,
          child: Image.network(
            thumbnail,
            height: thumbnailHeight,
            fit: BoxFit.fitHeight,
          ),
        ),
        const SizedBox(height: 10),

        //authors
        Text(
          author,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.blue[900]),
        ),
        const SizedBox(height: 10),

        // categories
        Text(
          categories,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 12, color: Colors.black54),
        ),
        const SizedBox(height: 10),

        // publisher
        Text(
          publisher,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 12, color: Colors.black54),
        ),
        const SizedBox(height: 5),

        //rating
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.star_rounded,
              color: ratingCount > 0 ? Colors.amber : Colors.black12,
              size: 24,
            ),
            Text(
              ratingAmount.toStringAsFixed(ratingAmount.truncateToDouble() == ratingAmount ? 0 : 1),
              style: const TextStyle(fontSize: 16),
            ),
            Text(
              ratingCount > 0 ? ' ($ratingCount)' : '',
              style: const TextStyle(fontSize: 14, color: Colors.black54),
            ),
          ],
        ),
        const SizedBox(height: 15),

        // buttons
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FlatButton(
              onPressed: () => _previewOrBuyBook(previewLink, context),
              child: const Text('Preview'),
              color: Colors.green,
              textColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            ),
            FlatButton(
              onPressed: () => _previewOrBuyBook(buyLink, context),
              child: const Text('Buy'),
              color: Colors.blue,
              textColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            ),
          ],
        ),
      ],
    ),
  );
}

bookDescription(String data) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Description', style: TextStyle(fontSize: 16)),
        const Divider(thickness: 2),
        Text(
          data,
          textAlign: TextAlign.left,
        ),
        const SizedBox(height: 20)
      ],
    ),
  );
}
