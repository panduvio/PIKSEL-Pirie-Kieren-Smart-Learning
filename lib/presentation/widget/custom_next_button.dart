import 'package:flutter/material.dart';
import 'package:geometry_app/constant/app_color.dart';
import 'package:heroicons/heroicons.dart';

class CustomNextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color contentColor;
  final String text;

  const CustomNextButton({
    super.key,
    this.backgroundColor = AppColor.cloudedVision,
    this.contentColor = AppColor.faience,
    required this.onPressed,
    this.text = 'Selanjutnya',
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      minWidth: double.minPositive,
      color: backgroundColor,
      child: SizedBox(
        // width: 200,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              text,
              style: TextStyle(
                color: contentColor,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(width: 20),
            HeroIcon(
              HeroIcons.arrowRight,
              size: 24,
              style: HeroIconStyle.solid,
              color: contentColor,
            ),
          ],
        ),
      ),
    );
  }
}
