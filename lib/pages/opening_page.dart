import 'package:flutter/material.dart';
import 'package:google_books_library/pages/book_list_page.dart';
import 'package:google_books_library/services/webservice.dart';
import 'package:google_books_library/widgets/snackbar.dart';

double screenWidth = 0;
double screenHeight = 0;

class OpeningPage extends StatefulWidget {
  const OpeningPage({Key? key}) : super(key: key);

  @override
  State<OpeningPage> createState() => _OpeningPageState();
}

class _OpeningPageState extends State<OpeningPage> {
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchInitialList();
  }

  _setScreenSize() {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height - MediaQuery.of(context).viewPadding.top;
  }

  _fetchInitialList() async {
    setState(() => _isLoading = true);
    await Webservice().fetchBookData('batman').then((response) {
      if (response is bool && !response) {
        setState(() => _isLoading = false);
        showSnackbar(context: context, content: 'Connection failed');
      } else {
        print(response.items);
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => BookListPage(bookList: response.items),
            ),
            (route) => false);
      }
    });
  }

  _splashLogo() {
    return Image.asset(
      'assets/splash_image.png',
      width: screenWidth / 2,
      fit: BoxFit.fitWidth,
    );
  }

  _loadingIndicator() {
    return SizedBox(
      height: screenWidth / 10,
      width: screenWidth / 10,
      child: CircularProgressIndicator(
        color: Colors.blue[200],
      ),
    );
  }

  _structure() {
    if (screenHeight == 0 && screenWidth == 0) {
      _setScreenSize();
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _splashLogo(),
        const SizedBox(height: 20),
        _isLoading
            ? _loadingIndicator()
            : SizedBox(
                height: screenWidth / 10,
                width: screenWidth / 10,
              ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: _structure(),
      ),
    );
  }
}
