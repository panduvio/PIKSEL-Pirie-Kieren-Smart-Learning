import 'package:flutter/material.dart';
import 'package:geometry_app/constant/app_color.dart';
import 'package:geometry_app/constant/app_text_style.dart';
import 'package:geometry_app/presentation/provider/page_provider.dart';
import 'package:geometry_app/presentation/widget/custom_material_bubble.dart';
import 'package:geometry_app/presentation/widget/custom_next_button.dart';
import 'package:provider/provider.dart';

class KubusPrimitiveKnowingPage extends StatefulWidget {
  const KubusPrimitiveKnowingPage({super.key});

  @override
  State<KubusPrimitiveKnowingPage> createState() =>
      _KubusPrimitiveKnowingPageState();
}

class _KubusPrimitiveKnowingPageState extends State<KubusPrimitiveKnowingPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      color: AppColor.wintersDay,
      child: Column(
        children: [
          Text(
            'KONSEP VOLUME (KUBUS SATUAN)',
            textAlign: TextAlign.center,
            style: AppTextStyle.titleTextStyle,
          ),
          SizedBox(height: 20),
          CustomMaterialBubble(
            heading: 'PRIMITIVE KNOWING',
            content: Container(
              child: Text(
                'Kita telah belajar mengenai bangun ruang salah satunya kubus. Kubus adalah bangun ruang tiga dimensi yang dibatasi oleh enam buah sisi berbentuk persegi yang kongruen (sama dan sebangun).',
                textAlign: TextAlign.justify,
                style: AppTextStyle.materialTextStyle,
              ),
            ),
          ),
          SizedBox(height: 20),
          Align(
            alignment: Alignment.centerRight,
            child: CustomNextButton(
              onPressed: () {
                Provider.of<PageProvider>(
                  context,
                  listen: false,
                ).setPageIndex(3);
              },
              text: 'Pelajari konsep volume\nbangun ruang dari kubus',
            ),
          ),
        ],
      ),
    );
  }
}
