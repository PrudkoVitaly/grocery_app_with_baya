import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:grocery_app_with_baya/core/app_theme/app_theme.dart';

class ElevatedButtonDefault extends StatelessWidget {
  final String text;
  final Image icon;
  final Function() onPressed;
  const ElevatedButtonDefault({
    super.key,
    required this.text,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding:
            const EdgeInsets.symmetric(vertical: 19, horizontal: 33),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        child: Row(
          // mainAxisSize: MainAxisSize.min,
          children: [
            icon,
            const SizedBox(width: 12.0),
            Text(
              textAlign: TextAlign.center,
              text,
              style: appTheme.textTheme.labelSmall,
            ),
          ],
        ),
      ),
    );
  }
}
