import 'package:flutter/material.dart';
import 'package:geometry_app/constant/app_color.dart';
import 'package:geometry_app/constant/app_text_style.dart';
import 'package:geometry_app/presentation/provider/page_provider.dart';
import 'package:geometry_app/presentation/widget/custom_code_popup.dart';
import 'package:geometry_app/presentation/widget/custom_kunci_jawaban.dart';
import 'package:geometry_app/presentation/widget/custom_question_bubble.dart';
import 'package:geometry_app/presentation/widget/custom_next_button.dart';
import 'package:provider/provider.dart';

class BalokStructuringPage extends StatefulWidget {
  const BalokStructuringPage({super.key});

  @override
  State<BalokStructuringPage> createState() => _BalokStructuringPageState();
}

class _BalokStructuringPageState extends State<BalokStructuringPage> {
  bool isAnswered = false;
  String code = 'STB2';
  String question =
      'Ali membuat balok dari tumpukan kubus satuan berukuran 1 cm³. Ia menyatakan bahwa baloknya berdimensi 6 cm × 5 cm × 2 cm. Namun ia hanya menggunakan 55 kubus. Evaluasilah pernyataan Ali.';
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
                    context.read<PageProvider>().setPageIndex(18);
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
    'Sudah tepat, \nkarena cukup menggunakan 55 kubus.',
    'Tidak tepat, \nkarena membutuhkan lebih dari 55 kubus',
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
        'Kunci jawaban: \nSeharusnya volume \n= 6 × 5 × 2 = 60 cm³\n\nAli hanya pakai 55 kubus, sehingga kurang 5 kubus\n\nPernyataan Ali tidak tepat, karena 55 kubus tidak bisa membentuk balok \nutuh dengan dimensi tersebut (B). ',
    questionNumber: '2',
  );
}
