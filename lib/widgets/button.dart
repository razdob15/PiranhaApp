import 'dart:ffi';

import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button(this.onPressed, this.text);

  final VoidCallback onPressed;

  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed,
    child: Text(text),
    style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).primaryColor)),
    
    );
  }
}