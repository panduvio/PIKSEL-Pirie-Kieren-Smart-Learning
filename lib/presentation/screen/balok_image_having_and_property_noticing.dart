import 'package:flutter/material.dart';
import 'package:geometry_app/constant/app_color.dart';
import 'package:geometry_app/constant/app_text_style.dart';
import 'package:geometry_app/presentation/provider/page_provider.dart';
import 'package:geometry_app/presentation/widget/custom_material_bubble.dart';
import 'package:geometry_app/presentation/widget/custom_next_button.dart';
import 'package:heroicons/heroicons.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BalokImageHavingAndPropertyNoticing extends StatefulWidget {
  const BalokImageHavingAndPropertyNoticing({super.key});

  @override
  State<BalokImageHavingAndPropertyNoticing> createState() =>
      _BalokImageHavingAndPropertyNoticingState();
}

class _BalokImageHavingAndPropertyNoticingState
    extends State<BalokImageHavingAndPropertyNoticing> {
  List<TextEditingController> jawabControllerList = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
  late SharedPreferences userSp;

  @override
  void initState() {
    initial();
    super.initState();
  }

  void initial() async {
    userSp = await SharedPreferences.getInstance();
    setState(() {
      for (int i = 0; i < 20; i++) {
        jawabControllerList[i].text = '${userSp.getString('balokINPH$i')}';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          SizedBox(height: 20),
          Text(
            'KONSEP VOLUME (KUBUS SATUAN)',
            textAlign: TextAlign.center,
            style: AppTextStyle.titleTextStyle,
          ),
          SizedBox(height: 20),
          CustomMaterialBubble(
            heading: 'IMAGE HAVING & PROPERTY NOTICING',
            content: Column(
              children: [
                Text(
                  'Perhatikan tabel berikut dan lengkapilah titik-titik pada tabel!',
                  textAlign: TextAlign.justify,
                  style: AppTextStyle.materialTextStyle,
                ),
                SizedBox(height: 6),
                Container(
                  // height: 500,
                  width: double.maxFinite,
                  // color: AppColor.balineseSunset,
                  child: Image.asset('assets/tabel_balok.png'),
                ),
                SizedBox(height: 6),
                Column(
                  children: List.generate(20, (index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'No. ${index + 1}:',
                            style: AppTextStyle.materialTextStyle,
                          ),
                          Container(
                            height: 50,
                            width: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: AppColor.white,
                            ),
                            child: TextField(
                              controller: jawabControllerList[index],
                              textAlign: TextAlign.center,
                              style: AppTextStyle.blueMaterialTextStyle,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          GestureDetector(
                            onTap: () => jawabControllerList[index].clear(),
                            child: HeroIcon(
                              HeroIcons.trash,
                              color: AppColor.white,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Align(
            alignment: Alignment.centerRight,
            child: CustomNextButton(
              onPressed: () {
                for (int i = 0; i < 20; i++) {
                  userSp.setString('balokIHPN$i', jawabControllerList[i].text);
                }
                Provider.of<PageProvider>(
                  context,
                  listen: false,
                ).setPageIndex(13);
              },
            ),
          ),
        ],
      ),
    );
  }
}
