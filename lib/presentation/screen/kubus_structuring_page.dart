import 'package:flutter/material.dart';
import 'package:geometry_app/constant/app_color.dart';
import 'package:geometry_app/constant/app_text_style.dart';
import 'package:geometry_app/presentation/provider/page_provider.dart';
import 'package:geometry_app/presentation/widget/custom_code_popup.dart';
import 'package:geometry_app/presentation/widget/custom_kunci_jawaban.dart';
import 'package:geometry_app/presentation/widget/custom_question_bubble.dart';
import 'package:geometry_app/presentation/widget/custom_next_button.dart';
import 'package:provider/provider.dart';

class KubusStructuringPage extends StatefulWidget {
  const KubusStructuringPage({super.key});

  @override
  State<KubusStructuringPage> createState() => _KubusStructuringPageState();
}

class _KubusStructuringPageState extends State<KubusStructuringPage> {
  bool isAnswered = false;
  @override
  Widget build(BuildContext context) {
    String question =
        'Seorang siswa menyatakan bahwa kubus dengan panjang rusuk 12 cm memiliki volume 1728 cm³. Apakah pernyataan siswa tersebut benar?';
    String code = 'STK2';
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
                      context.read<PageProvider>().setPageIndex(9);
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
    'Benar,\nkarena perhitungan sesuai',
    'Tidak,\nkarena perhitungan tidak sesuai',
  ];
  return CustomQuestionBubble(
    heading: 'STRUCTURING',
    question: question,
    answerIndex: answerList.length,
    answerList: answerList,
    questionNumber: '2',
  );
}

Widget kunciJawabanPage(BuildContext context, String question) {
  return CustomKunciJawaban(
    heading: 'STRUCTURING',
    question: question,
    answer:
        'Kunci jawaban:\nVolume kubus = s³ = 12³ = 1728 cm³\n\nPernyataan siswa benar, karena perhitungannya sesuai (A). ',
    questionNumber: '2',
  );
}
