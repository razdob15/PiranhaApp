import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  // final Function(String) onChange;
  // sesrchBar({Key? key, required this.onChange}) : super(key: key);


  @override
  State<StatefulWidget> createState() {
    return InputState();
  }
}

class InputState extends State<SearchBar> {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      color:Colors.black,
  padding: EdgeInsets.all(20),
  child: TextField(
    decoration: InputDecoration(
      hintText: "Search...",
      hintStyle: TextStyle(color: Colors.grey.shade600),
      prefixIcon: Icon(Icons.search,color: Theme.of(context).primaryColorDark, size: 20,),
      filled: true,
      fillColor: Colors.grey.shade100,
      contentPadding: EdgeInsets.all(8),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),

      ),
    ),
  ),
);
  }
}