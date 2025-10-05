import 'package:flutter/material.dart';
import 'package:geometry_app/constant/app_color.dart';
import 'package:geometry_app/constant/app_text_style.dart';
import 'package:geometry_app/presentation/provider/page_provider.dart';
import 'package:geometry_app/presentation/screen/balok_screen.dart';
import 'package:geometry_app/presentation/widget/custom_code_popup.dart';
import 'package:geometry_app/presentation/widget/custom_kunci_jawaban.dart';
import 'package:geometry_app/presentation/widget/custom_question_bubble.dart';
import 'package:geometry_app/presentation/widget/custom_next_button.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BalokInventisingPage extends StatefulWidget {
  const BalokInventisingPage({super.key});

  @override
  State<BalokInventisingPage> createState() => _BalokInventisingPageState();
}

class _BalokInventisingPageState extends State<BalokInventisingPage> {
  bool isAnswered = false;
  String code = 'CHL1';
  String question =
      'Untuk membuat bentuk balok dengan volume 240 cm³. Berapa panjang dan lebar balok jika tinggi balok adalah 8 cm. (Pilih 2 jawaban) ';
  late SharedPreferences userSp;

  @override
  void initState() {
    initial();
    super.initState();
  }

  void initial() async {
    userSp = await SharedPreferences.getInstance();
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
          isAnswered
              ? kunciJawabanPage(context, question)
              : questionPage(context, question),
          SizedBox(height: 20),
          Align(
            alignment: Alignment.centerRight,
            child: CustomNextButton(
              onPressed: () {
                setState(() {
                  context.read<PageProvider>().setCodeCorrect(false);
                  final status = context.read<PageProvider>().isChoiceChosen;
                  if (status) {
                    showDialog(
                      context: context,
                      builder: (context) => PopScope(
                        onPopInvokedWithResult: (didPop, result) {
                          if (context.read<PageProvider>().isCodeCorrect ==
                              true) {
                            isAnswered = true;
                          }
                        },
                        child: AlertDialog(
                          backgroundColor: AppColor.transparent,
                          content: CustomCodePopup(
                            isAnswered: isAnswered,
                            code: code,
                            // targetRoute: 8,
                          ),
                        ),
                      ),
                    );
                  } else if (isAnswered) {
                    isAnswered == false;
                    if (context.read<PageProvider>().balokLevel < 3) {
                      Provider.of<PageProvider>(
                        context,
                        listen: false,
                      ).setBalokLevel(3);
                      userSp.setInt('balokLevel', 3);
                    }
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BalokScreen(stage: 'EVALUASI'),
                      ),
                    );
                  }
                  context.read<PageProvider>().setChoice(false);
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

Widget questionPage(BuildContext context, String question) {
  final List<String> answerList = [
    'p = 6 cm, l = 5 cm',
    'p = 10 cm, l = 4 cm',
    'p = 7,5 cm, l = 4 cm',
    'p = 15 cm, l = 3 cm',
    'p = 3 cm, l = 8 cm',
  ];
  return CustomQuestionBubble(
    heading: 'INVENTISING',
    question: question,
    answerIndex: answerList.length,
    answerList: answerList,
    questionNumber: '3',
  );
}

Widget kunciJawabanPage(BuildContext context, String question) {
  return CustomKunciJawaban(
    heading: 'INVENTISING',
    question: question,
    answer:
        'Kunci Jawaban: \np×l= V/t = 240/8=30 (dua bilangan yang hasil kalinya 30) \nKemungkinan pasangan:\n1 × 30\n2 × 15\n3 × 10\n5 × 6\n6 × 5\n7,5 × 4\n4 × 7,5\nKarena panjang (p) harus lebih besar atau sama dengan lebar (l), jawaban yang mungkin adalah:\n𝑝 = 6 cm dan 𝑙 = 5 cm\n𝑝 = 7,5 cm dan 𝑙 = 4 cm',
    questionNumber: '3',
  );
}
