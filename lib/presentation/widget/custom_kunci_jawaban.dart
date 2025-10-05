import 'package:flutter/material.dart';
import 'package:geometry_app/constant/app_color.dart';
import 'package:geometry_app/constant/app_text_style.dart';

class CustomKunciJawaban extends StatelessWidget {
  final double padding;
  final double width;
  final double borderRadius;
  final String heading;
  final String question;
  final String questionNumber;
  final String answer;
  final Color color;
  const CustomKunciJawaban({
    super.key,
    this.padding = 12,
    this.width = double.maxFinite,
    this.borderRadius = 16,
    this.color = AppColor.faience,
    required this.heading,
    required this.question,
    required this.answer,
    required this.questionNumber,
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
          Padding(
            padding: const EdgeInsets.all(12),
            child: Table(
              columnWidths: {0: FlexColumnWidth(1), 1: FlexColumnWidth(12)},
              children: [
                TableRow(
                  children: [
                    Text(
                      questionNumber + '.',
                      textAlign: TextAlign.center,
                      style: AppTextStyle.materialTextStyle,
                    ),
                    Text(
                      question,
                      textAlign: TextAlign.justify,
                      style: AppTextStyle.materialTextStyle,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(padding),
            width: width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(borderRadius),
                bottomRight: Radius.circular(borderRadius),
              ),
              color: AppColor.white,
            ),
            child: Text(
              answer,
              textAlign: TextAlign.justify,
              style: AppTextStyle.blueMaterialTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}
