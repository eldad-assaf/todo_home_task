import 'package:flutter/material.dart';

class InfoRow extends StatelessWidget {
  final String text;
  final IconData iconData;

  const InfoRow({Key? key, required this.text, required this.iconData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(text),
        const SizedBox(width: 4),
        Icon(iconData),
      ],
    );
  }
}
