import 'package:flutter/material.dart';

showSnackbar({required BuildContext context, required String content, bool isError = false}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(content, maxLines: 2),
      backgroundColor: isError ? Colors.red : Colors.blue[200],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      margin: const EdgeInsets.all(10),
    ),
  );
}
