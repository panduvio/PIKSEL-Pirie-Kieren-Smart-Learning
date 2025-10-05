import 'package:flutter/material.dart';
import 'package:geometry_app/domain/entities/evaluasi_entity.dart';
import 'package:geometry_app/domain/entities/user_entity.dart';
import 'package:geometry_app/presentation/provider/bloc/user_bloc.dart';
import 'package:geometry_app/presentation/provider/page_provider.dart';
import 'package:geometry_app/presentation/screen/leaderboard_screen.dart';
import 'package:geometry_app/presentation/widget/custom_question_bubble.dart';
import 'package:geometry_app/presentation/widget/custom_next_button.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class KubusEvaluasiPage extends StatefulWidget {
  const KubusEvaluasiPage({super.key});

  @override
  State<KubusEvaluasiPage> createState() => _KubusEvaluasiPageState();
}

class _KubusEvaluasiPageState extends State<KubusEvaluasiPage> {
  final soalList = evaluasiKubusList;
  int correct = 0;
  int questionNumber = 1;
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
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          SizedBox(height: 20),
          CustomQuestionBubble(
            isHeading: false,
            heading: '',
            question: soalList[questionNumber - 1].question,
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
                      user.evaluasiKubus1 = answer;
                    } else {
                      user.evaluasiKubus2 = answer;
                    }
                    questionNumber = questionNumber + 1;
                  } else {
                    user.evaluasiKubus3 = answer;
                    double score = (correct / questionNumber) * 100;
                    user.leaderboardScore = score.truncateToDouble();
                    context.read<UserBloc>().add(UpdateUser(user: user));

                    Provider.of<PageProvider>(
                      context,
                      listen: false,
                    ).setUserLevel(2);
                    userSp.setInt('userLevel', 2);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LeaderboardScreen(),
                      ),
                    );
                    // Provider.of<PageProvider>(
                    //   context,
                    //   listen: false,
                    // ).setPageIndex(0);
                  }
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
