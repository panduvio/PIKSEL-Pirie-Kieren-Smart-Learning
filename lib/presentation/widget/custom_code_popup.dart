import 'package:flutter/material.dart';
import 'package:geometry_app/constant/app_color.dart';
import 'package:geometry_app/constant/app_text_style.dart';
import 'package:geometry_app/presentation/provider/page_provider.dart';
import 'package:geometry_app/presentation/widget/custom_next_button.dart';
import 'package:provider/provider.dart';

class CustomCodePopup extends StatelessWidget {
  final double padding;
  final bool isAnswered;
  final String code;
  // final int targetRoute;

  const CustomCodePopup({
    required this.isAnswered,
    // required this.targetRoute,
    required this.code,
    this.padding = 12,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController codeController = TextEditingController();
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(10),
      height: 200,
      width: 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColor.faience,
      ),
      child: Column(
        children: [
          Text(
            'Masukkan Kode Jawaban!',
            textAlign: TextAlign.center,
            style: AppTextStyle.whiteTitleTextStyle,
          ),
          Spacer(),
          Container(
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColor.white,
            ),
            child: TextField(
              controller: codeController,
              textCapitalization: TextCapitalization.characters,
              textAlign: TextAlign.center,
              style: AppTextStyle.blackMaterialTextStyle,
              decoration: InputDecoration(border: InputBorder.none),
            ),
          ),
          Spacer(),
          CustomNextButton(
            text: 'Lanjut',
            onPressed: () {
              print('code: $code, controller: ${codeController.text}');
              if (codeController.text == code) {
                context.read<PageProvider>().setCodeCorrect(true);
                Navigator.pop(context);
                // context.read<PageProvider>().setPageIndex(targetRoute);
              }
            },
          ),
        ],
      ),
    );
  }
}
