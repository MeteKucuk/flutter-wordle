import 'package:flutter/material.dart';
import 'package:wordle/wordle/model/letter_model.dart';

const _qwerty = [
  ['Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P'],
  ['A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L'],
  ['ENTER', 'Z', 'X', 'C', 'V', 'B', 'N', 'M', 'DEL']
];

class Keyboard extends StatelessWidget {
  const Keyboard(
      {Key? key,
      required this.letters,
      required this.onkeyTapped,
      required this.onDeleteTapped,
      required this.onEnterTapped})
      : super(key: key);

  final void Function(String) onkeyTapped;
  final VoidCallback onDeleteTapped;
  final VoidCallback onEnterTapped;
  final Set<Letter> letters;

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _qwerty
            .map((e) => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: e.map((letter) {
                    if (letter == 'DEL') {
                      return _KeyboardButton.delete(onTap: onDeleteTapped);
                    } else if (letter == 'ENTER') {
                      return _KeyboardButton.enter(onTap: onEnterTapped);
                    }

                    final letterKey = letters.firstWhere((e) => e.val == letter,
                        orElse: () => Letter.empty());
                    return _KeyboardButton(
                      backgroundColor: letterKey != Letter.empty()
                          ? letterKey.backgroundColor
                          : Colors.grey,
                      onTap: () => onkeyTapped(letter),
                      letter: letter,
                    );
                  }).toList(),
                ))
            .toList());
  }
}

class _KeyboardButton extends StatelessWidget {
  const _KeyboardButton({
    Key? key,
    this.height = 48,
    this.width = 30,
    required this.onTap,
    required this.backgroundColor,
    required this.letter,
  }) : super(key: key);
  final double height;
  final double width;
  final VoidCallback onTap;
  final Color backgroundColor;
  final String letter;

  factory _KeyboardButton.delete({
    required VoidCallback onTap,
  }) =>
      _KeyboardButton(
          onTap: onTap, backgroundColor: Colors.grey, letter: 'DEL');
  factory _KeyboardButton.enter({required VoidCallback onTap}) =>
      _KeyboardButton(
          onTap: onTap, backgroundColor: Colors.grey, letter: 'ENTER');
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 3, horizontal: 2),
        child: Material(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(4),
          child: InkWell(
            onTap: onTap,
            child: Container(
              height: height,
              width: width,
              alignment: Alignment.center,
              child: Text(
                letter,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ));
  }
}
