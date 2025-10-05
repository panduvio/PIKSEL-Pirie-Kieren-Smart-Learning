import 'package:flutter/material.dart';
import 'package:geometry_app/constant/app_color.dart';
import 'package:geometry_app/constant/app_text_style.dart';
import 'package:geometry_app/presentation/provider/page_provider.dart';
import 'package:geometry_app/presentation/widget/custom_material_bubble.dart';
import 'package:geometry_app/presentation/widget/custom_next_button.dart';
import 'package:heroicons/heroicons.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BalokFormalizing extends StatefulWidget {
  const BalokFormalizing({super.key});

  @override
  State<BalokFormalizing> createState() => _BalokFormalizingState();
}

class _BalokFormalizingState extends State<BalokFormalizing> {
  TextEditingController jawabController = TextEditingController();
  late SharedPreferences userSp;

  @override
  void initState() {
    initial();
    super.initState();
  }

  void initial() async {
    userSp = await SharedPreferences.getInstance();
    setState(() {
      jawabController = TextEditingController(
        text: userSp.getString('balokFormalizing'),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Text(
            'KONSEP VOLUME (KUBUS SATUAN)',
            textAlign: TextAlign.center,
            style: AppTextStyle.titleTextStyle,
          ),
          SizedBox(height: 20),
          CustomMaterialBubble(
            heading: 'FORMALIZING',
            content: Column(
              children: [
                Text(
                  'Yang telah Anda kerjakan di atas adalah menentukan volume balok. \nApa maksud dari “volume balok” menurutmu setelah melihat melakukan \nkegiatan di atas?',
                  textAlign: TextAlign.justify,
                  style: AppTextStyle.materialTextStyle,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Jawab:',
                    textAlign: TextAlign.left,
                    style: AppTextStyle.materialTextStyle,
                  ),
                ),
                SizedBox(height: 6),
                Row(
                  children: [
                    Container(
                      height: 50,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: AppColor.white,
                      ),
                      child: TextField(
                        controller: jawabController,
                        textAlign: TextAlign.center,
                        style: AppTextStyle.blueMaterialTextStyle,
                        decoration: InputDecoration(border: InputBorder.none),
                      ),
                    ),
                    SizedBox(width: 10),
                    GestureDetector(
                      onTap: () => jawabController.clear(),
                      child: HeroIcon(
                        HeroIcons.trash,
                        color: AppColor.white,
                        size: 30,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
          SizedBox(height: 20),
          Align(
            alignment: Alignment.centerRight,
            child: CustomNextButton(
              onPressed: () {
                userSp.setString('balokFormalizing', jawabController.text);
                Provider.of<PageProvider>(
                  context,
                  listen: false,
                ).setPageIndex(14);
              },
            ),
          ),
        ],
      ),
    );
  }
}
