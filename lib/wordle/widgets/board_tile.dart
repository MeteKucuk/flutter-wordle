import 'package:flutter/material.dart';
import 'package:wordle/wordle/model/letter_model.dart';

class BoardTile extends StatelessWidget {
  const BoardTile({Key? key, required this.letter}) : super(key: key);
  final Letter letter;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(4),
        height: 48,
        width: 48,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: letter.backgroundColor,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: letter.borderColor)),
        child: Text(
          letter.val,
          style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ));
  }
}
