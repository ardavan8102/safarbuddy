import 'package:flutter/material.dart';

class CircularIconButton extends StatelessWidget {
  final IconData? icon;
  final Color? color;
  final Function() func;
  const CircularIconButton({
    super.key,
    required this.icon,
    required this.color,
    required this.func
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(100)
      ),
      child: IconButton(
        onPressed: func,
        icon: Icon(
          icon,
          color: color,
        )
      ),
    );
  }
}