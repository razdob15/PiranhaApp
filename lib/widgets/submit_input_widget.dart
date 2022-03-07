import 'package:flutter/material.dart';

class GeneralSubmitInput extends StatefulWidget {
  final Function(String) onSubmitted;
  GeneralSubmitInput({Key? key, required this.onSubmitted}) : super(key: key);


  @override
  State<StatefulWidget> createState() {
    return InputState();
  }
}

class InputState extends State<GeneralSubmitInput> {
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
              height: 60,
              width: 400,
              child: TextField(  
                onSubmitted: widget.onSubmitted,
                decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter a search term',
              ),
            ),
            );
  }
}