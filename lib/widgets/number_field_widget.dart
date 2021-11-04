import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NumberTextField extends StatefulWidget {
  const NumberTextField({Key? key, this.controller, this.onChanged}) : super(key: key);
  
  final TextEditingController? controller;
  final void Function(String)? onChanged;

  @override
  _NumberTextFieldState createState() => _NumberTextFieldState();
}

class _NumberTextFieldState extends State<NumberTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      onChanged: widget.onChanged,
      // expands: false,
      textAlign: TextAlign.center,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      //  TODO: add more decoration stuff
      decoration: const InputDecoration(hintText: '0'),
    );
  }
}