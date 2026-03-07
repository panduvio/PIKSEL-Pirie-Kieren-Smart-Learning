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

class KubusPropertyNoticingPage extends StatefulWidget {
  const KubusPropertyNoticingPage({super.key});

  @override
  State<KubusPropertyNoticingPage> createState() =>
      _KubusPropertyNoticingPageState();
}

class _KubusPropertyNoticingPageState extends State<KubusPropertyNoticingPage> {
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
        text: answers.kubusPropertyNoticing,
        // text: userSp.getString('kubusPropertyNoticing'),
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
            heading: 'PROPERTY NOTICING',
            content: Column(
              children: [
                Text(
                  'Dari kegiatan di atas, coba Anda hitung volume kubus di atas secara sederhana/secara ringkas dengan menggunakan perkalian panjang kubus satuan?',
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
                  kubusPropertyNoticing: jawabController.text,
                );
                context.read<PageProvider>().setUserAnswers(fixedAnswer);
                context.read<UserBloc>().add(
                  SaveAnswer(fixedAnswer, answers.id),
                );

                // userSp.setString('kubusPropertyNoticing', jawabController.text);
                Provider.of<PageProvider>(
                  context,
                  listen: false,
                ).setPageIndex(6);
              },
            ),
          ),
        ],
      ),
    );
  }
}
