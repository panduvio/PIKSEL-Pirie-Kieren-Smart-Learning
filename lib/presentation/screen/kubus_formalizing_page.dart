import 'package:flutter/material.dart';
import 'package:geometry_app/constant/app_color.dart';
import 'package:geometry_app/constant/app_text_style.dart';
import 'package:geometry_app/presentation/provider/page_provider.dart';
import 'package:geometry_app/presentation/screen/kubus_screen.dart';
import 'package:geometry_app/presentation/widget/custom_material_bubble.dart';
import 'package:geometry_app/presentation/widget/custom_next_button.dart';
import 'package:heroicons/heroicons.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class KubusFormalizingPage extends StatefulWidget {
  const KubusFormalizingPage({super.key});

  @override
  State<KubusFormalizingPage> createState() => _KubusFormalizingPageState();
}

class _KubusFormalizingPageState extends State<KubusFormalizingPage> {
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
        text: userSp.getString('kubusFormalizing'),
      );
    });
  }

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
            heading: 'FORMALIZING',
            content: Column(
              children: [
                Text(
                  'Perhatikan kubus dengan panjang sisi s Gambar 1.4. berikut! ',
                  textAlign: TextAlign.justify,
                  style: AppTextStyle.materialTextStyle,
                ),
                SizedBox(height: 6),
                Container(
                  height: 150,
                  // color: AppColor.white,
                  child: Image.asset(
                    'assets/kubus_formalizing.png',
                    scale: 7,
                    fit: BoxFit.none,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Gambar 1.4 Kubus dengan panjang sisi s',
                  textAlign: TextAlign.center,
                  style: AppTextStyle.materialTextStyle,
                ),
                SizedBox(height: 6),
                Text(
                  'Dapatkah kamu merumuskan volume sebuah kubus tersebut? Jelaskan!',
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
                userSp.setString('kubusFormalizing', jawabController.text);
                if (context.read<PageProvider>().kubusLevel < 2) {
                  Provider.of<PageProvider>(
                    context,
                    listen: false,
                  ).setKubusLevel(2);
                  userSp.setInt('kubusLevel', 2);
                }
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => KubusScreen(stage: 'KOLABORASI'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
