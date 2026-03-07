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

class KubusImageMakingPage extends StatefulWidget {
  const KubusImageMakingPage({super.key});

  @override
  State<KubusImageMakingPage> createState() => _KubusImageMakingPageState();
}

class _KubusImageMakingPageState extends State<KubusImageMakingPage> {
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
        text: answers.kubusImageMaking,
        // text: userSp.getString('kubusImageMaking'),
      );
    });
  }

  @override
  void dispose() {
    jawabController.dispose();
    super.dispose();
  }

  Widget kubusImageMakingFirst(BuildContext context) {
    return CustomMaterialBubble(
      heading: 'IMAGE MAKING',
      content: Column(
        children: [
          Text(
            'Amati kubus satuan Gambar 1.1 berikut!',
            textAlign: TextAlign.justify,
            style: AppTextStyle.materialTextStyle,
          ),
          SizedBox(height: 6),
          Container(
            height: 100,
            child: Image.asset(
              'assets/kubus.png',
              scale: 10,
              // height: 10,
              fit: BoxFit.none,
            ),
          ),
          SizedBox(height: 6),
          Text(
            'Gambar 1.1 Satu Kubus Satuan',
            textAlign: TextAlign.center,
            style: AppTextStyle.materialTextStyle,
          ),
          SizedBox(height: 6),
          Text(
            'Ambil kubus satuan dengan panjang rusuk 1 cm, lebar 1 cm, dan tinggi 1 cm. Perhatikan Gambar 1.2 berikut!',
            textAlign: TextAlign.justify,
            style: AppTextStyle.materialTextStyle,
          ),
          SizedBox(height: 6),
          Container(
            height: 100,
            width: double.maxFinite,
            color: AppColor.white,
            child: Image.asset(
              'assets/gambar_1_2.png',
              scale: 5,
              // height: 10,
              fit: BoxFit.none,
            ),
          ),
          SizedBox(height: 6),
          Text(
            'Gambar 1.2 Kubus Transparan dan Kubus Terisi ',
            textAlign: TextAlign.center,
            style: AppTextStyle.materialTextStyle,
          ),
          SizedBox(height: 6),
          Text(
            'Ada berapa kubus satuan yang dapat mengisi kubus transparansi',
            textAlign: TextAlign.justify,
            style: AppTextStyle.materialTextStyle,
          ),
          SizedBox(height: 6),
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
          SizedBox(height: 6),
          Text(
            'Perhatikan Gambar 1.3. berikut ini!',
            textAlign: TextAlign.justify,
            style: AppTextStyle.materialTextStyle,
          ),
          SizedBox(height: 6),
          Container(
            height: 130,
            width: double.maxFinite,
            color: AppColor.white,
            child: Image.asset(
              'assets/gambar_1_3.png',
              scale: 5,
              fit: BoxFit.none,
            ),
          ),
          SizedBox(height: 6),
          Text(
            'Gambar 1.3 Kubus Satuan ',
            textAlign: TextAlign.center,
            style: AppTextStyle.materialTextStyle,
          ),
          SizedBox(height: 6),
          Text(
            'Yang telah Anda kerjakan di atas adalah menentukan volume kubus. Jadi volume kubus B adalah 8, volume kubus C adalah 9, dan volume kubus D adalah 64.',
            textAlign: TextAlign.justify,
            style: AppTextStyle.materialTextStyle,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      color: AppColor.wintersDay,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'KONSEP VOLUME (KUBUS SATUAN)',
              textAlign: TextAlign.center,
              style: AppTextStyle.titleTextStyle,
            ),
            SizedBox(height: 20),
            // kubusImageMakingFirst(context),
            kubusImageMakingFirst(context),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerRight,
              child: CustomNextButton(
                onPressed: () {
                  final answers = context.read<PageProvider>().answers;
                  final fixedAnswer = answers.copyWith(
                    kubusImageMaking: jawabController.text,
                  );
                  context.read<PageProvider>().setUserAnswers(fixedAnswer);
                  context.read<UserBloc>().add(
                    SaveAnswer(fixedAnswer, answers.id),
                  );

                  // userSp.setString('kubusImageMaking', jawabController.text);
                  Provider.of<PageProvider>(
                    context,
                    listen: false,
                  ).setPageIndex(4);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
