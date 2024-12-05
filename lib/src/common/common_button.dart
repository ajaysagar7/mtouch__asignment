// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  final String title;
  final VoidCallback callback;
  const CommonButton({
    Key? key,
    required this.title,
    required this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:  callback,
      child: Container(
        height: 50,
        width: MediaQuery.sizeOf(context).width * 0.6,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.blue
        ),
        child: Center(child: Text(title,style: TextStyle(color: Colors.white),)),
      ));
  }
}
