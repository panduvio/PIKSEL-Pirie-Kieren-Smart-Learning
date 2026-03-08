import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:geometry_app/domain/entities/evaluasi_entity.dart';
import 'package:geometry_app/domain/entities/user_entity.dart';
import 'package:geometry_app/presentation/provider/bloc/user_bloc.dart';
import 'package:geometry_app/presentation/provider/page_provider.dart';
import 'package:geometry_app/presentation/widget/custom_question_bubble.dart';
import 'package:geometry_app/presentation/widget/custom_next_button.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class KubusBalokEvaluasiPage extends StatefulWidget {
  final bool isPretest;
  final UserEntity user;
  const KubusBalokEvaluasiPage({
    required this.isPretest,
    required this.user,
    super.key,
  });

  @override
  State<KubusBalokEvaluasiPage> createState() =>
      _KubusBalokEvaluasiPageState(user, isPretest);
}

class _KubusBalokEvaluasiPageState extends State<KubusBalokEvaluasiPage> {
  UserEntity user;
  bool isPretest;
  bool isSubmitted = false;
  final soalList = evaluasiKubusBalokList;
  int questionNumber = 1;
  TextEditingController essayController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  late SharedPreferences userSp;
  final Uri _url = Uri.parse(
    'https://drive.google.com/drive/folders/1ei6Ultc3FiudHnp6pPOaaBLFHLQnsqNP',
  );

  _KubusBalokEvaluasiPageState(this.user, this.isPretest);

  @override
  void initState() {
    initial();
    super.initState();
  }

  void initial() async {
    userSp = await SharedPreferences.getInstance();
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(height: 10),
          CustomQuestionBubble(
            isEssay: soalList[questionNumber - 1].isEssay,
            essayController: essayController,
            formKey: formKey,
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
          SizedBox(height: 10),
          Align(
            alignment: Alignment.centerRight,
            child: BlocConsumer<UserBloc, UserState>(
              listenWhen: (previous, current) => current is PostSuccessState,
              listener: (context, state) {
                if (state is PostSuccessState) {
                  final id = state.id;
                  Provider.of<PageProvider>(
                    context,
                    listen: false,
                  ).setUserId(id);
                  print("New Firestore ID: $id");
                }
              },
              builder: (context, userState) {
                return CustomNextButton(
                  onPressed: () {
                    setState(() {
                      if (questionNumber < soalList.length) {
                        String currentAnswer = context
                            .read<PageProvider>()
                            .currentAnswer;
                        switch (questionNumber) {
                          case 1:
                            if (isPretest == true) {
                              user.preTest1 = currentAnswer;
                            } else {
                              user.postTest1 = currentAnswer;
                            }
                            break;
                          case 2:
                            if (isPretest == true) {
                              user.preTest2 = currentAnswer;
                            } else {
                              user.postTest2 = currentAnswer;
                            }
                            break;
                          case 3:
                            if (isPretest == true) {
                              user.preTest3 = currentAnswer;
                            } else {
                              user.postTest3 = currentAnswer;
                            }
                            break;
                          case 4:
                            if (isPretest == true) {
                              user.preTest4 = currentAnswer;
                            } else {
                              user.postTest4 = currentAnswer;
                            }
                            break;
                          case 5:
                            if (isPretest == true) {
                              user.preTest5 = currentAnswer;
                            } else {
                              user.postTest5 = currentAnswer;
                            }
                            break;
                        }
                        questionNumber = questionNumber + 1;
                        print(user.toMap());
                      } else {
                        if (isPretest == true) {
                          user.preTest6 = context
                              .read<PageProvider>()
                              .currentAnswer;
                          context.read<PageProvider>().setTest(false);
                          final answer = context.read<PageProvider>().answers;
                          context.read<UserBloc>().add(
                            SaveAnswer(
                              answer.copyWith(isPretest: false),
                              answer.id,
                            ),
                          );
                          context.read<PageProvider>().setUserAnswers(
                            answer.copyWith(isPretest: false),
                          );
                          userSp.setBool('isPretest', false);

                          context.read<UserBloc>().add(
                            UpdateUser(user: context.read<PageProvider>().user),
                          );
                          Provider.of<PageProvider>(
                            context,
                            listen: false,
                          ).setPageIndex(0);
                        } else if (isSubmitted) {
                          user.postTest6 = context
                              .read<PageProvider>()
                              .currentAnswer;

                          context.read<UserBloc>().add(
                            UpdateUser(user: context.read<PageProvider>().user),
                          );
                          Provider.of<PageProvider>(
                            context,
                            listen: false,
                          ).setPageIndex(0);
                        } else {
                          _launchUrl();
                          isSubmitted = true;
                        }
                        print(isSubmitted);
                      }
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
