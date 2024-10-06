import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app_with_baya/core/app_theme/app_colors.dart';

class ElevetadButtonWidget extends StatelessWidget {
  final String text;
  final Function() onTap;
  const ElevetadButtonWidget(
      {super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 60,
        width: double.infinity,
        // margin: const EdgeInsets.symmetric(horizontal: 17),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Color(0XFF6CC51D).withOpacity(0.25),
              blurRadius: 9,
              offset: Offset(0, 10),
              spreadRadius: 0,
            ),
          ],
          gradient: const LinearGradient(
            colors: [
              AppColors.primaryColorBeginButton,
              AppColors.primaryColorEndButton,
            ],
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ),
      ),
    );
  }
}
