import 'package:flutter/material.dart';

class GeneralInput extends StatefulWidget {
  final Function(String) onChange;
  final String labelText;
  const GeneralInput({Key? key, required this.onChange, required this.labelText})
      : super(key: key);

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
        decoration: InputDecoration(
          filled: true,
          fillColor: Theme.of(context).primaryColor,
          border: const OutlineInputBorder(),
          hintText: widget.labelText,
          hintStyle: const TextStyle(color: Colors.white, )
        ),
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
