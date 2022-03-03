import 'package:flutter/material.dart';
import 'package:google_books_library/widgets/book_list_tiles.dart';

import '../services/webservice.dart';
import '../widgets/snackbar.dart';

// ignore: must_be_immutable
class BookListPage extends StatefulWidget {
  BookListPage({Key? key, this.bookList}) : super(key: key);

  // ignore: prefer_typing_uninitialized_variables
  var bookList;

  @override
  State<BookListPage> createState() => _BookListPageState();
}

class _BookListPageState extends State<BookListPage> {
  final TextEditingController _controller = TextEditingController();
  List bookList = [];

  @override
  void initState() {
    super.initState();
    _getInitialList();
  }

  _getInitialList() {
    if (widget.bookList != null) {
      bookList = List.from(widget.bookList);
      widget.bookList.clear();
    }
  }

  _searchBox() {
    return Container(
      padding: const EdgeInsets.only(left: 10),
      height: kToolbarHeight - 20,
      decoration: BoxDecoration(
        color: Colors.grey[350],
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: _controller,
        onSubmitted: (value) {
          if (value.isNotEmpty) {
            _searchBook(value);
            _controller.clear();
            FocusScope.of(context).unfocus();
          }
        },
        style: TextStyle(color: Colors.blue[900]),
        decoration: const InputDecoration(
          hintText: "Search",
          hintStyle: TextStyle(color: Colors.black38),
          border: InputBorder.none,
          icon: Icon(Icons.search_rounded),
        ),
        textInputAction: TextInputAction.search,
      ),
    );
  }

  _searchBook(String keyword) async {
    await Webservice().fetchBookData(keyword).then((response) {
      if (response is bool && !response) {
        showSnackbar(context: context, content: 'Connection failed');
      } else {
        bookList = List.from(response.items);
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: _searchBox(),
          centerTitle: true,
        ),
        body: bookListTile(context, bookList),
      ),
    );
  }
}
