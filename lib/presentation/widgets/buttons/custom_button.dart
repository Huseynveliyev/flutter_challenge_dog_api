import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    this.width,
    required this.text,
    required this.onPressed,
    this.color = Colors.greenAccent,
    this.textColor,
    this.radius = 28,
  }) : super(key: key);

  final double? width;
  final String text;
  final Function onPressed;
  final Color color;
  final Color? textColor;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      height: 56,
      child: ElevatedButton(
        onPressed: () => onPressed(),
        style: ElevatedButton.styleFrom(
          backgroundColor: color, // Renk parametresi burada kullanılıyor
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
        child: Text(
          text,
        ),
      ),
    );
  }
}
