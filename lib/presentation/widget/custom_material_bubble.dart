import 'package:flutter/material.dart';
import 'package:geometry_app/constant/app_color.dart';
import 'package:geometry_app/constant/app_text_style.dart';

class CustomMaterialBubble extends StatelessWidget {
  final double padding;
  final double width;
  final double borderRadius;
  final String heading;
  final Widget content;
  final Color color;

  const CustomMaterialBubble({
    super.key,
    this.padding = 12,
    this.width = double.maxFinite,
    this.borderRadius = 16,
    this.color = AppColor.faience,
    required this.heading,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(borderRadius),
          bottomRight: Radius.circular(borderRadius),
        ),
        color: color,
      ),
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: 70,
            width: width,
            color: AppColor.white,
            child: Text(
              heading,

              textAlign: TextAlign.center,
              style: AppTextStyle.headingTextStyle,
            ),
          ),
          SizedBox(height: 12),
          Padding(padding: EdgeInsets.all(padding), child: content),
        ],
      ),
    );
  }
}
