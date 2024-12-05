// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CommonTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintTitle;

  const CommonTextField({
    Key? key,
    required this.textEditingController,
    required this.hintTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      decoration: InputDecoration(
        hintText: hintTitle,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8)
        ),
        enabledBorder:  OutlineInputBorder(
           borderRadius: BorderRadius.circular(8)
        )
      ),
    );
  }
}
