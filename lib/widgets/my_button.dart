import 'package:flutter/material.dart';
import 'package:iliski_kocu/theme/colors.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    super.key,
    this.onPressed,
    required this.text,
    this.icon,
    this.color = MyColors.primary,
    this.textColor = Colors.white,
  });

  final void Function()? onPressed;
  final String text;
  final Widget? icon;
  final Color color;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(0),
          backgroundColor: color,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon ?? const SizedBox.shrink(),
            if (text.isNotEmpty) ...[
              const SizedBox(width: 10),
              Text(text, style: TextStyle(color: textColor, fontWeight: FontWeight.w600)),
            ],
          ],
        ),
      ),
    );
  }
}
