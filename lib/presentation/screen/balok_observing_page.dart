import 'package:flutter/material.dart';
import 'package:geometry_app/constant/app_color.dart';
import 'package:geometry_app/constant/app_text_style.dart';
import 'package:geometry_app/presentation/provider/page_provider.dart';
import 'package:geometry_app/presentation/widget/custom_code_popup.dart';
import 'package:geometry_app/presentation/widget/custom_kunci_jawaban.dart';
import 'package:geometry_app/presentation/widget/custom_question_bubble.dart';
import 'package:geometry_app/presentation/widget/custom_next_button.dart';
import 'package:provider/provider.dart';

class BalokObservingPage extends StatefulWidget {
  const BalokObservingPage({super.key});

  @override
  State<BalokObservingPage> createState() => _BalokObservingPageState();
}

class _BalokObservingPageState extends State<BalokObservingPage> {
  bool isAnswered = false;
  String question =
      'Sebuah balok memiliki ukuran panjang 10 cm, lebar 4 cm, dan tinggi 3 cm. Jika tinggi balok ditambah 2 cm, berapa pertambahan volumenya?';
  String code = 'OBV3';
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
                    context.read<PageProvider>().setPageIndex(17);
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
    '40 cm³',
    '80 cm³',
    '120 cm³',
    '200 cm³',
    '240 cm³',
  ];
  return CustomQuestionBubble(
    heading: 'OBSERVING',
    question: question,
    answerIndex: answerList.length,
    answerList: answerList,
    questionNumber: '1',
  );
}

Widget kunciJawabanPage(BuildContext context, String question) {
  return CustomKunciJawaban(
    heading: 'OBSERVING',
    question: question,
    answer:
        'Kunci Jawaban:\nVolume awal: 10 × 4 × 3 = 120 cm³\n\nVolume baru: 10 × 4 × 5 = 200 cm³\n\nSelisih volume = 80 cm³, ada kenaikan volume yang signifikan karena \npeningkatan tinggi (B). ',
    questionNumber: '1',
  );
}
