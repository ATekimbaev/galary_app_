import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  const InputWidget({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.func
  }) : super(key: key);

 final TextEditingController controller;
  final String hintText;
  final Function() func;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: func,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
      ),
    );
  }
}
