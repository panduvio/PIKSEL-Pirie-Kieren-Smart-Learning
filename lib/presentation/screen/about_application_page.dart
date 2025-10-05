import 'package:flutter/material.dart';
import 'package:geometry_app/constant/app_color.dart';
import 'package:geometry_app/constant/app_text_style.dart';

class AboutApplicationPage extends StatelessWidget {
  const AboutApplicationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'TENTANG APLIKASI',
            style: TextStyle(
              fontFamily: 'Anton',
              fontSize: 40,
              fontWeight: FontWeight.w100,
              color: AppColor.faience,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'PIKSEL: Pirie-Kieren Smart Learning adalah platform digital berbasis gamifikasi untuk membantu mahasiswa mengembangkan Higher Order Thinking Skills (HOTS) pada materi geometri. Platform ini mengadopsi teori Pirie-Kieren, melalui tahapan pemahaman berjenjang: primitive knowing, image making, image having, property noticing, formalising, observing, hingga structuring.',
            textAlign: TextAlign.justify,
            style: AppTextStyle.blackMaterialTextStyle,
          ),
        ],
      ),
    );
  }
}
