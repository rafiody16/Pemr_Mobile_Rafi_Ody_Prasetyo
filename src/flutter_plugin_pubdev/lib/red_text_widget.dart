import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class RedTextWidget extends StatelessWidget {
  final String text;

  // const RedTextWidget({Key? key}) : super(key: key);
  const RedTextWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Container();
    return AutoSizeText(
      // text,
      'Rafi Ody Prasetyo | 2341720180',
      style: const TextStyle(color: Colors.red, fontSize: 14),
    );
  }
}
