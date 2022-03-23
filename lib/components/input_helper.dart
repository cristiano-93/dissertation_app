import 'package:flutter/material.dart';

import '../theme.dart';

class TextInput extends StatelessWidget {
  const TextInput({
    Key? key,
    required this.hintText,
    required this.icon,
  }) : super(key: key);
  final String hintText;
  final Icon icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        border: Border.all(
          color: AppColors.kButtonBorder,
          width: 2,
        ),
      ),
      child: Expanded(
        child: Center(
          child: TextField(
            style: const TextStyle(fontSize: 20),
            decoration: InputDecoration(
              hintText: hintText,
              icon: icon,
              border: InputBorder.none,
              contentPadding: const EdgeInsets.only(left: 10),
            ),
          ),
        ),
      ),
    );
  }
}
