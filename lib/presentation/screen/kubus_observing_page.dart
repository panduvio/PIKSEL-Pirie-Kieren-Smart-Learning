import 'package:flutter/material.dart';
import 'package:geometry_app/constant/app_color.dart';
import 'package:geometry_app/constant/app_text_style.dart';
import 'package:geometry_app/presentation/provider/page_provider.dart';
import 'package:geometry_app/presentation/widget/custom_code_popup.dart';
import 'package:geometry_app/presentation/widget/custom_kunci_jawaban.dart';
import 'package:geometry_app/presentation/widget/custom_question_bubble.dart';
import 'package:geometry_app/presentation/widget/custom_next_button.dart';
import 'package:provider/provider.dart';

class KubusObservingPage extends StatefulWidget {
  const KubusObservingPage({super.key});

  @override
  State<KubusObservingPage> createState() => _KubusObservingPageState();
}

class _KubusObservingPageState extends State<KubusObservingPage> {
  bool isAnswered = false;

  @override
  Widget build(BuildContext context) {
    String question =
        'Dina melihat tiga kotak berbentuk kubus, satu berwarna merah dengan panjang rusuk 6 cm, dan satu lagi biru dengan panjang rusuk 3 cm. Jika kedua kubus digabungkan (tanpa tumpang tindih), apakah volume gabungannya lebih besar dari satu kubus berwarna kuning dengan rusuk 8 cm? Dan apa alasannya?';
    String code = 'OBK1';
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
                      context.read<PageProvider>().setPageIndex(8);
                    }
                    context.read<PageProvider>().setChoice(false);
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget questionPage(BuildContext context, String question) {
  final List<String> answerList = [
    'Ya, karena lebih besar volume gabungan kubus merah dan biru',
    'Tidak, karena lebih besar volume kubus kuning',
    'Tidak, karena besar volume gabungan dan kubus kuning adalah sama',
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
        'Kunci jawaban: \nVolume kubus merah:\n6³ = 216 cm³\n\nVolume kubus biru:\n3³ = 27 cm³\n\nTotal volume gabungan\n= 216 + 27 = 243 cm³\n\nVolume kubus kuning:\n8³ = 512 cm³ \n243 < 512\n\nJadi gabungan dua kubus tidak lebih besar dari volume kubus kuning (B) ',
    questionNumber: '1',
  );
}
