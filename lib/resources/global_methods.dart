import 'package:flutter/material.dart';

showSnackBar(
  BuildContext context,
  String snackBarContent,
) {
  ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text(snackBarContent)));
}
