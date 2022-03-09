import 'dart:ui';

import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  final Function(String) onChange;
  
  SearchBar({Key? key, required this.onChange}) : super(key: key);


  @override
  State<StatefulWidget> createState() {
    return InputState();
  }
}

class InputState extends State<SearchBar> {
  final myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green[100],
  padding: EdgeInsets.all(20),
  child: TextField(
    controller: myController,
        onChanged: (value) => {
          widget.onChange(myController.text)},
    decoration: InputDecoration(
      hintText: "Search chat...",
      hintStyle: TextStyle(color: Colors.grey.shade600),
      prefixIcon: Icon(Icons.search,color: Colors.grey.shade600, size: 20,),
      filled: true,
      fillColor: Colors.grey.shade100,
      contentPadding: EdgeInsets.all(8),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
              color: Colors.grey.shade100
          )
      ),
    ),
  ),
);
  }
}