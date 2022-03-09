import 'package:flutter/material.dart';
import '../widgets/chatsList.dart';
import '../widgets/searchBar.dart';

class ChatPage extends StatefulWidget {

String searchInput = '';

  @override
  State<StatefulWidget> createState() {
    return InputState();
  }
}

class InputState extends State<ChatPage> {
  
  @override
  Widget build(BuildContext context) {
    
    return Column(
      children: [
        SearchBar(
         onChange: (value) {
          setState(() {
            this.widget.searchInput = value.toLowerCase();
          });
        }
          ),
        Flexible(child: Listtt(searchInput: this.widget.searchInput)),
      ]
    );
  }
}


Flexible getListttt(search) {
  return Flexible(child: Listtt(searchInput: search));
}