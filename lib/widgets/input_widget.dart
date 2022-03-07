import 'package:flutter/material.dart';

class GeneralInput extends StatefulWidget {
  final Function(String) onChange;
  GeneralInput({Key? key, required this.onChange}) : super(key: key);


  @override
  State<StatefulWidget> createState() {
    return InputState();
  }
}

class InputState extends State<GeneralInput> {
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
              height: 60,
              width: 400,
              child: TextField(  
                onChanged: widget.onChange,
                decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter a search term',
              ),
            ),
            );
  }
}