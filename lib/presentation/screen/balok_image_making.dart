import 'package:flutter/material.dart';
import 'package:geometry_app/constant/app_color.dart';
import 'package:geometry_app/constant/app_text_style.dart';
import 'package:geometry_app/presentation/provider/bloc/user_bloc.dart';
import 'package:geometry_app/presentation/provider/page_provider.dart';
import 'package:geometry_app/presentation/widget/custom_material_bubble.dart';
import 'package:geometry_app/presentation/widget/custom_next_button.dart';
import 'package:heroicons/heroicons.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BalokImageMaking extends StatefulWidget {
  const BalokImageMaking({super.key});

  @override
  State<BalokImageMaking> createState() => _BalokImageMakingState();
}

class _BalokImageMakingState extends State<BalokImageMaking> {
  TextEditingController jawabController = TextEditingController();
  late SharedPreferences userSp;

  @override
  void initState() {
    initial();
    super.initState();
  }

  void initial() async {
    userSp = await SharedPreferences.getInstance();
    final answers = context.read<PageProvider>().answers;
    setState(() {
      jawabController = TextEditingController(
        text: answers.balokImageMaking,
        // text: userSp.getString('balokImageMaking'),
      );
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
            heading: 'IMAGE MAKING',
            content: Column(
              children: [
                Text(
                  'Setelah mengetahui konsep volume dari kubus satuan, selanjutnya kita akan mempelajari volume balok dari kubus satuan.',
                  textAlign: TextAlign.justify,
                  style: AppTextStyle.materialTextStyle,
                ),
                SizedBox(height: 6),
                Text(
                  'Perhatikan Gambar 2.1 berikut!',
                  textAlign: TextAlign.justify,
                  style: AppTextStyle.materialTextStyle,
                ),
                SizedBox(height: 6),
                Container(
                  height: 100,
                  width: double.maxFinite,
                  color: AppColor.white,
                  child: Image.asset(
                    'assets/gambar_2_1.png',
                    fit: BoxFit.none,
                    scale: 4.5,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Gambar 2.1 Kubus Satuan dalam Balok',
                  textAlign: TextAlign.center,
                  style: AppTextStyle.materialTextStyle,
                ),
                SizedBox(height: 6),
                Text(
                  'Perhatikan Gambar 2.2 berikut!',
                  textAlign: TextAlign.justify,
                  style: AppTextStyle.materialTextStyle,
                ),
                SizedBox(height: 6),
                Container(
                  height: 100,
                  width: double.maxFinite,
                  color: AppColor.white,
                  child: Image.asset(
                    'assets/gambar_2_2.png',
                    fit: BoxFit.none,
                    scale: 4.5,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Gambar 2.2 Balik Transparan dan Balok Terisi',
                  textAlign: TextAlign.center,
                  style: AppTextStyle.materialTextStyle,
                ),
                SizedBox(height: 6),
                Text(
                  'Ada berapa kubus satuan yang dapat mengisi balok transparansi di atas?',
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
                final answers = context.read<PageProvider>().answers;
                final fixedAnswer = answers.copyWith(
                  balokImageMaking: jawabController.text,
                );
                context.read<PageProvider>().setUserAnswers(fixedAnswer);
                context.read<UserBloc>().add(
                  SaveAnswer(fixedAnswer, answers.id),
                );
                // userSp.setString('balokImageMaking', jawabController.text);
                Provider.of<PageProvider>(
                  context,
                  listen: false,
                ).setPageIndex(12);
              },
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
