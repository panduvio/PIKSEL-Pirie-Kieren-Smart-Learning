import 'package:flutter/material.dart';
import 'package:geometry_app/constant/app_color.dart';
import 'package:geometry_app/domain/entities/evaluasi_entity.dart';
import 'package:geometry_app/domain/entities/user_entity.dart';
import 'package:geometry_app/presentation/provider/bloc/user_bloc.dart';
import 'package:geometry_app/presentation/provider/page_provider.dart';
import 'package:geometry_app/presentation/screen/kubus_screen.dart';
import 'package:geometry_app/presentation/widget/custom_question_bubble.dart';
import 'package:geometry_app/presentation/widget/custom_next_button.dart';
import 'package:heroicons/heroicons.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BalokEvaluasiPage extends StatefulWidget {
  const BalokEvaluasiPage({super.key});

  @override
  State<BalokEvaluasiPage> createState() => _BalokEvaluasiPageState();
}

class _BalokEvaluasiPageState extends State<BalokEvaluasiPage> {
  final soalList = evaluasiBalokList;
  int questionNumber = 1;
  int correct = 0;
  int showDialogButton = 0;
  late SharedPreferences userSp;
  late UserEntity user;

  @override
  void initState() {
    user = context.read<PageProvider>().user;
    initial();
    super.initState();
  }

  void initial() async {
    userSp = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(height: 20),
          CustomQuestionBubble(
            isImage: soalList[questionNumber - 1].isImage,
            image: soalList[questionNumber - 1].image,
            isHeading: false,
            heading: '',
            question: soalList[questionNumber - 1].question,
            afterImageQuestion: soalList[questionNumber - 1].afterImageQuestion,
            answerIndex: soalList.length,
            answerList: soalList[questionNumber - 1].answerList,
            questionNumber: '$questionNumber',
          ),
          SizedBox(height: 20),
          Align(
            alignment: Alignment.centerRight,
            child: CustomNextButton(
              onPressed: () {
                setState(() {
                  final answer = context.read<PageProvider>().currentAnswer;
                  if (answer == soalList[questionNumber - 1].answer) {
                    correct++;
                  }

                  if (questionNumber < soalList.length) {
                    if (questionNumber == 1) {
                      user.evaluasiBalok1 = answer;
                    } else {
                      user.evaluasiBalok2 = answer;
                    }
                    questionNumber = questionNumber + 1;
                  } else {
                    user.evaluasiBalok3 = answer;
                    double score = (correct / questionNumber) * 100;
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        backgroundColor: AppColor.transparent,
                        content: Container(
                          padding: EdgeInsets.only(
                            top: 20,
                            left: 20,
                            right: 20,
                          ),
                          height: 350,
                          width: 330,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: AppColor.nevermindNirvana,
                          ),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Spacer(),
                                  HeroIcon(
                                    HeroIcons.star,
                                    style: HeroIconStyle.solid,
                                    color: correct < 1
                                        ? AppColor.silver
                                        : AppColor.yellow,
                                    size: 70,
                                  ),
                                  SizedBox(width: 4),
                                  HeroIcon(
                                    HeroIcons.star,
                                    style: HeroIconStyle.solid,
                                    color: correct < 2
                                        ? AppColor.silver
                                        : AppColor.yellow,
                                    size: 85,
                                  ),
                                  SizedBox(width: 4),
                                  HeroIcon(
                                    HeroIcons.star,
                                    style: HeroIconStyle.solid,
                                    color: correct < 3
                                        ? AppColor.silver
                                        : AppColor.yellow,
                                    size: 70,
                                  ),
                                  Spacer(),
                                ],
                              ),
                              SizedBox(height: 10),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Score:',
                                  style: TextStyle(
                                    fontFamily: 'Anton',
                                    fontSize: 30,
                                    color: AppColor.faience,
                                  ),
                                ),
                              ),
                              Center(
                                child: Text(
                                  '${score.truncate()}',
                                  style: TextStyle(
                                    color: AppColor.white,
                                    fontSize: 70,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                              Spacer(),
                              Container(
                                height: 80,
                                width: 230,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20),
                                  ),
                                  color: AppColor.faience,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    GestureDetector(
                                      onTapDown: (value) {
                                        setState(() {
                                          showDialogButton = 1;
                                        });
                                      },
                                      onTapUp: (details) {
                                        setState(() {
                                          showDialogButton = 0;
                                        });
                                        Navigator.pop(context);
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                KubusScreen(stage: 'EVALUASI'),
                                          ),
                                        );
                                      },
                                      onTapCancel: () {
                                        setState(() {
                                          showDialogButton = 0;
                                        });
                                      },
                                      child: HeroIcon(
                                        HeroIcons.arrowPath,
                                        style: HeroIconStyle.solid,
                                        color: showDialogButton == 1
                                            ? AppColor.balineseSunset
                                            : AppColor.white,
                                        size: 50,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTapDown: (value) {
                                        setState(() {
                                          showDialogButton = 2;
                                        });
                                      },
                                      onTapUp: (details) {
                                        setState(() {
                                          showDialogButton = 0;
                                        });
                                        Navigator.pop(context);
                                        context
                                            .read<PageProvider>()
                                            .setPageIndex(0);
                                      },
                                      onTapCancel: () {
                                        setState(() {
                                          showDialogButton = 0;
                                        });
                                      },
                                      child: HeroIcon(
                                        HeroIcons.home,
                                        style: HeroIconStyle.solid,
                                        color: showDialogButton == 2
                                            ? AppColor.balineseSunset
                                            : AppColor.white,
                                        size: 50,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTapDown: (value) {
                                        setState(() {
                                          showDialogButton = 3;
                                        });
                                      },
                                      onTapUp: (details) {
                                        setState(() {
                                          showDialogButton = 0;

                                          user.challengeScore = score
                                              .truncateToDouble();
                                          print(user.toMap());
                                          context.read<UserBloc>().add(
                                            UpdateUser(user: user),
                                          );
                                        });
                                        Provider.of<PageProvider>(
                                          context,
                                          listen: false,
                                        ).setUserLevel(3);
                                        final answer = context
                                            .read<PageProvider>()
                                            .answers;
                                        context.read<UserBloc>().add(
                                          SaveAnswer(
                                            answer.copyWith(userLevel: 3),
                                            answer.id,
                                          ),
                                        );
                                        context
                                            .read<PageProvider>()
                                            .setUserAnswers(
                                              answer.copyWith(userLevel: 3),
                                            );
                                        // userSp.setInt('userLevel', 3);
                                        Navigator.pop(context);
                                        context
                                            .read<PageProvider>()
                                            .setPageIndex(0);
                                      },
                                      onTapCancel: () {
                                        setState(() {
                                          showDialogButton = 0;
                                        });
                                      },
                                      child: HeroIcon(
                                        HeroIcons.arrowRightCircle,
                                        style: HeroIconStyle.solid,
                                        color: showDialogButton == 3
                                            ? AppColor.balineseSunset
                                            : AppColor.white,
                                        size: 50,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                });
                // setState(() {
                //   if (questionNumber < soalList.length) {
                //     questionNumber = questionNumber + 1;
                //   } else {
                //     Provider.of<PageProvider>(
                //       context,
                //       listen: false,
                //     ).setUserLevel(3);
                //     userSp.setInt('userLevel', 3);

                //     Provider.of<PageProvider>(
                //       context,
                //       listen: false,
                //     ).setPageIndex(0);
                //   }
                // });
                print(questionNumber);
              },
            ),
          ),
        ],
      ),
    );
  }
}
