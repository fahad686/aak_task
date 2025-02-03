import 'package:flutter/material.dart';

Future<void> showCustomDialog(context,Widget body) async {

  return showDialog<void>(
    context: context,
    barrierDismissible: true, // user must tap button!
    builder: (BuildContext context) {
      return Center(
        child: Container(
          margin: const EdgeInsets.all(30),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Material (
              child: body
          ),
        ),
      );
    },
  );
}