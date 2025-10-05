import 'package:flutter/material.dart';
import 'package:geometry_app/constant/app_color.dart';
import 'package:geometry_app/constant/app_text_style.dart';
import 'package:geometry_app/presentation/provider/page_provider.dart';
import 'package:geometry_app/presentation/screen/kubus_screen.dart';
import 'package:geometry_app/presentation/widget/custom_code_popup.dart';
import 'package:geometry_app/presentation/widget/custom_kunci_jawaban.dart';
import 'package:geometry_app/presentation/widget/custom_question_bubble.dart';
import 'package:geometry_app/presentation/widget/custom_next_button.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class KubusInventisingPage extends StatefulWidget {
  const KubusInventisingPage({super.key});

  @override
  State<KubusInventisingPage> createState() => _KubusInventisingPageState();
}

class _KubusInventisingPageState extends State<KubusInventisingPage> {
  bool isAnswered = false;
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
    String question =
        'Rancangan bentuk bangun ruang dengan penggabungan 4 kubus identik membentuk huruf L. Jika rusuk setiap kubus 5 cm, berapa volume total bangun tersebut?';
    String code = 'LDR3';
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
                      if (context.read<PageProvider>().kubusLevel < 3) {
                        Provider.of<PageProvider>(
                          context,
                          listen: false,
                        ).setKubusLevel(3);
                        userSp.setInt('kubusLevel', 3);
                      }
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => KubusScreen(stage: 'EVALUASI'),
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
      ),
    );
  }
}

Widget questionPage(BuildContext context, String question) {
  final List<String> answerList = [
    '80 cm³',
    '100 cm³',
    '125 cm³',
    '300 cm³',
    '500 cm³',
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
        'Kunci jawaban: \nVolume satu kubus = 5³ = 125 cm³\n\nTotal volume = 4 × 125 = 500 cm³ (E) ',
    questionNumber: '3',
  );
}
